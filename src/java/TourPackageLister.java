import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Element;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;

public class TourPackageLister {

    public static void main(String[] args) {
        String xmlPath = "Tours.xml";

        try {
            // 1. Setup Document Builder
            File xmlFile = new File(xmlPath);
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            
            // 2. Parse the XML file into a Document object
            Document doc = dBuilder.parse(xmlFile);
            doc.getDocumentElement().normalize();

            System.out.println("✅ Document parsed successfully. Listing Tour Packages:");
            
            // 3. Get all <Package> elements
            NodeList packageList = doc.getElementsByTagName("Package");

            System.out.println("------------------------------------");
            System.out.println("Total Packages Found: " + packageList.getLength());
            System.out.println("------------------------------------");

            // 4. Iterate and extract data
            for (int i = 0; i < packageList.getLength(); i++) {
                Element packageElement = (Element) packageList.item(i);
                
                String packageId = packageElement.getAttribute("id");
                
                // Navigate to the <Name> child element
                String packageName = packageElement.getElementsByTagName("Name").item(0).getTextContent();
                
                System.out.println((i + 1) + ". " + packageName + " (ID: " + packageId + ")");
            }
            
        } catch (Exception e) {
            System.out.println("❌ Error processing XML with DOM: " + e.getMessage());
            e.printStackTrace();
        }
    }
}