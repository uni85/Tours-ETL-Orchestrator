@ECHO OFF
TITLE ✅ Finishing Cycling Tours Project Outputs

ECHO ****************************************************
ECHO * 1. PREPARING ENVIRONMENT AND COMPILING JAVA *
ECHO ****************************************************
ECHO.

:: Create output directory if necessary
IF NOT EXIST output (
    mkdir output
    ECHO [STATUS] Created 'output' folder.
) ELSE (
    ECHO [STATUS] 'output' folder already exists.
)

:: Recompile Java with the output path fix
javac TransXML.java TourPackageLister.java
IF ERRORLEVEL 1 (
    ECHO ❌ ERROR: Java compilation failed. Check TransXML.java and TourPackageLister.java.
    PAUSE
    EXIT /B 1
)
ECHO [STATUS] Java files compiled successfully.
ECHO.

:: --- 2. RUN JAVA PROGRAMS (2 Outputs) ---
ECHO ****************************************************
ECHO * 2. RUNNING JAVA PROGRAMS (XSLT and DOM API) *
ECHO ****************************************************
ECHO.

:: Output 1: UpcominEvents.xsl (via TransXML.java) - Assumes TransXML.java has been edited to output to "output/events.html"
java TransXML
:: The output file is automatically reported by the Java program
ECHO.

:: Output 2: Package List (via TourPackageLister.java DOM API)
java TourPackageLister > output\package_list_dom.txt
ECHO ✅ Generated output\package_list_dom.txt (DOM API Output)
ECHO.

:: --- 3. RUN PYTHON TRANSFORMATIONS (9 Outputs) ---
ECHO ****************************************************
ECHO * 3. RUNNING PYTHON XSLT TRANSFORMATIONS (9 Files) *
ECHO ****************************************************
ECHO.

:: NOTE: Using the file names as seen in your directory:
:: availableBikes.xsl, Bookings.XSL, guideAssignements.xsl, Guides.xsl, pathJSON.xsl, Routes.xsl, simpleEvents.xsl, clientsJSON.xsl, TourPackages.xsl

:: 6 HTML Outputs
python TransXML.py TourPackages.xsl packages.html output
python TransXML.py availableBikes.xsl bikes.html output
python TransXML.py Routes.xsl paths_by_dest.html output
python TransXML.py Guides.xsl guides.html output
python TransXML.py Bookings.XSL bookings_report.html output

:: 2 XML Outputs
python TransXML.py simpleEvents.xsl events_summary.xml output
python TransXML.py guideAssignements.xsl package_guides.xml output

:: 2 JSON Outputs (Needed for Step 4)
python TransXML.py clientsJSON.xsl clients.json output
python TransXML.py pathJSON.xsl paths.json output

ECHO.

:: --- 4. JSON VALIDATION (1 Output) ---
ECHO ****************************************************
ECHO * 4. RUNNING JSON SCHEMA VALIDATION *
ECHO ****************************************************
ECHO.

:: Output 12: JSON Validation Status (using the fixed jsonValidator.py)
python jsonValidator.py > output\clients_validation_status.txt
ECHO ✅ Validation status saved to output\clients_validation_status.txt
ECHO.

ECHO ****************************************************
ECHO * PROJECT COMPLETE! All 12 files are in the 'output' folder. *
ECHO ****************************************************
PAUSE
