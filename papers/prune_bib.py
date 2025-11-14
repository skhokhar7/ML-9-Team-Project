## This script prunes a BibTeX file by removing entries that are not valid for quarto document rendering.
import sys
try:
    import bibtexparser
    from bibtexparser.bparser import BibTexParser
    from bibtexparser.customization import convert_to_unicode
    from bibtexparser.bibdatabase import BibDatabase
    from bibtexparser.bwriter import BibTexWriter
except Exception:
    print("Missing dependency: bibtexparser. Install it with: python -m pip install bibtexparser")
    sys.exit(1)

import logging
from typing import List
logging.basicConfig(level=logging.INFO)

# Entries are examined for validity based on their formatting.
def is_valid_entry(entry: dict) -> bool:
    """Check if a BibTeX entry is valid for quarto rendering."""
    required_fields = ['author', 'title', 'year']
    for field in required_fields:
        if field not in entry or not entry[field].strip():
            return False
    return True 

def prune_bibtex(input_file: str, output_file: str) -> None:
    """Prune invalid entries from a BibTeX file."""
    with open(input_file, 'r', encoding='utf-8') as bibtex_file:
        parser = BibTexParser()
        parser.customization = convert_to_unicode
        bib_database = bibtexparser.load(bibtex_file, parser=parser)

    valid_entries = [entry for entry in bib_database.entries if is_valid_entry(entry)]
    # Create a BibDatabase and assign entries (BibDatabase() does not accept
    # `entries` in its constructor for some bibtexparser versions).
    db_out = BibDatabase()
    db_out.entries = valid_entries

    writer = BibTexWriter()
    # Optional: set writer preferences (preserve order, indenting)
    writer.order_entries_by = None

    with open(output_file, 'w', encoding='utf-8') as output_bibtex_file:
        output_bibtex_file.write(writer.write(db_out))

def main(filename: str) -> None:
    prune_bibtex(filename, filename)
    logging.info(f"Pruned BibTeX file saved to {filename}")
    logging.info("Pruning completed.")

if __name__ == "__main__":
    import sys
    if len(sys.argv) != 2:
        print("Usage: python prune_bib.py <input_bibtex_file>")
        sys.exit(1)
    input_bibtex_file = sys.argv[1]
    main(input_bibtex_file)
