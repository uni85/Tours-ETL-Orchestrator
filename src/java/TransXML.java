import java.io.File;
import javax.xml.XMLConstants;
import javax.xml.transform.*;
import javax.xml.transform.stream.StreamSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.validation.*;

public class TransXML {

    public static void main(String[] args) {
        // File paths (adjust if needed)
        String xmlPath = "Tours.xml";
        String xsdPath = "tours.xsd";
        String xsltPath = "UpcominEvents.xsl";
        String outputPath = "output/outputJava.html";

        // Validate XML against XSD
        if (validateXML(xmlPath, xsdPath)) {
            System.out.println("✅ XML is valid against the schema.");
        } else {
            System.out.println("❌ XML validation failed. Fix errors before transforming.");
            return;
        }

        // Apply XSLT transformation
        try {
            TransformerFactory factory = TransformerFactory.newInstance();
            Source xslt = new StreamSource(new File(xsltPath));
            Transformer transformer = factory.newTransformer(xslt);

            Source xml = new StreamSource(new File(xmlPath));
            Result output = new StreamResult(new File(outputPath));

            transformer.transform(xml, output);
            System.out.println("✅ Transformation complete. Output saved to: " + outputPath);
        } catch (Exception e) {
            System.out.println("❌ Error during transformation: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // validate XML against XSD
    public static boolean validateXML(String xmlPath, String xsdPath) {
        try {
            SchemaFactory schemaFactory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
            Schema schema = schemaFactory.newSchema(new File(xsdPath));
            Validator validator = schema.newValidator();
            validator.validate(new StreamSource(new File(xmlPath)));
            return true;
        } catch (Exception e) {
            System.out.println("❌ Validation error: " + e.getMessage());
            return false;
        }
    }
}
