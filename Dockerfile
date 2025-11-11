FROM mambaorg/micromamba:1.4.4

# Use micromamba to create a reproducible conda environment, then install Python packages
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV JUPYTER_TOKEN=ml9

ENV MAMBA_DIR=/opt/micromamba
ENV CONDA_DIR=/opt/conda
ENV PATH=$CONDA_DIR/envs/ml9/bin:$CONDA_DIR/bin:$PATH

WORKDIR /app

# Switch to root to install system packages (base image may use a non-root user)
USER root

# Install essential system packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends curl ca-certificates bzip2 gnupg git build-essential \
    && rm -rf /var/lib/apt/lists/*

# Continue as root (micromamba operations below require root in this image)
WORKDIR /app

# The base image `mambaorg/micromamba` already provides a working micromamba binary
# for the container architecture, so no standalone download is necessary here.

# Copy just requirements first for better cache reuse
COPY requirements.txt /app/
COPY environment.yml /app/

# Create conda environment from environment.yml (conda-forge packages) then pip-install remainder
RUN micromamba create -y -p $CONDA_DIR/envs/ml9 -f /app/environment.yml -c conda-forge && \
    $CONDA_DIR/envs/ml9/bin/python -m pip install --upgrade pip setuptools wheel && \
    # sanitize requirements: remove local file:// references (these point to build artifacts not available in the image)
    grep -vE "(file://|@ file|^faiss==)" /app/requirements.txt > /app/requirements-pip.txt || true && \
    cat /app/requirements-pip.txt && \
    $CONDA_DIR/envs/ml9/bin/python -m pip install --no-cache-dir --no-deps -r /app/requirements-pip.txt

# Copy the rest of the repository
COPY . /app

EXPOSE 8888

# Create a non-root user to run Jupyter more safely
RUN useradd -m -s /bin/bash appuser && \
    chown -R appuser:appuser /app /opt/conda/envs/ml9

# Force CPU-only behavior for torch / transformers (avoid CUDA lib preload errors)
ENV CUDA_VISIBLE_DEVICES=""

USER appuser

# Default: launch Jupyter Lab from the conda environment (updated flags for ServerApp)
CMD ["sh", "-c", "/opt/conda/envs/ml9/bin/jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --ServerApp.token=${JUPYTER_TOKEN} --ServerApp.allow_origin='*' --ServerApp.allow_remote_access=True"]
