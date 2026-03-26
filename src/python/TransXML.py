import sys
import os
from lxml import etree

XML_PATH = "Tours.xml" 
# ----------------------------------------------------

if len(sys.argv) != 4:
    print("Usage: python TransXML.py <XSLT_FILE> <OUTPUT_FILE> <OUTPUT_FOLDER>")
    sys.exit(1)

XSLT_PATH = sys.argv[1]
OUTPUT_FILE = sys.argv[2]
OUTPUT_FOLDER = sys.argv[3]


def transform_xml(xml_path, xslt_path, output_path):
    """Applies an XSLT stylesheet to an XML file."""
    try:
        xml_doc = etree.parse(xml_path)
        xslt_doc = etree.parse(xslt_path)
        
        transform = etree.XSLT(xslt_doc)
        result_tree = transform(xml_doc)
        
        # Save output. 
        with open(output_path, 'wb') as f:
            f.write(result_tree)
            
        print(f"SUCCESS: {xslt_path} -> {output_path}")
    except Exception as e:
        print(f"FAILURE: Error during transformation {xslt_path}: {e}")


if __name__ == "__main__":
    output_path = os.path.join(OUTPUT_FOLDER, OUTPUT_FILE)
    transform_xml(XML_PATH, XSLT_PATH, output_path)