# Tours-ETL-Orchestrator

## Repository Structure
```text
Tours-ETL-Orchestrator/
├── data/                  # Source Data & Validation Schemas
│   ├── Tours.xml          # Primary Database
│   ├── tours.xsd          # XML Schema Definition
│   └── clientsSchema.json # JSON Schema for post-transformation validation
├── src/
│   ├── java/              # JAXP & DOM Processing
│   │   ├── TransXML.java
│   │   └── TourPackageLister.java
│   ├── python/            # Scripted Transformations & Validation
│   │   ├── TransXML.py
│   │   └── jsonValidator.py
│   └── xsl/               # Transformation Logic (10 Files)
│       ├── availableBikes.xsl
│       ├── Bookings.xsl
│       ├── tourPackages.xsl
│       ├── clientsJSON.xsl
│       ├── guideAssignements.xsl
│       ├── Guides.xsl
│       ├── pathJSON.xsl
│       ├── Routes.xsl
│       ├── simpleEvents.xsl
│       └── UpcominEvents.xsl
├── run_project.bat        # Central Orchestration Script
├── LICENSE                # MIT License
└── README.md              # Documentation
'''

## Project Overview
Tours-ETL-Orchestrator is a multi-stage **Data Transformation Pipeline** for cycling tour logistics

![Build Status](https://img.shields.io/badge/Build-Automated-success)
![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey)
![License](https://img.shields.io/badge/License-MIT-blue)

## Project Overview
This repository contains a high-performance **Multi-Stage Data Pipeline** designed for a global cycling tour agency. The system centralizes logistics and booking data in a validated XML "Source of Truth" and utilizes a hybrid **Java/Python architecture** to automate business intelligence reporting.

## Repository Structure
The project is modularized to separate data, logic, and presentation:

* **`/data`**: Contains the primary XML database and its associated XSD and JSON schemas.
* **`/src`**: 
    * `java/`: High-level DOM parsing and JAXP transformations.
    * `python/`: Flexible scripting for XSLT processing and Schema validation.
    * `xsl/`: A library of 10 XSL stylesheets defining diverse business views.
* **`run_pipeline.bat`**: The central orchestration engine.

---

## The Pipeline (run_pipeline.bat)
The entire workflow is automated through a Windows Batch script. It manages the lifecycle from raw data validation to final asset generation.

### Pipeline Logic:
1.  **Environment Sync:** Initializes output directories and compiles Java dependencies.
2.  **Java Layer:** Executes XSD validation and DOM-based extraction.
3.  **Transformation Layer:** Parallel XSLT rendering of HTML dashboards and JSON objects.
4.  **Integrity Check:** Validates generated JSON against strict schemas for frontend compatibility.

```batch
@ECHO OFF
TITLE Cycling Tours Pipeline Execution

:: 1. Preparation
IF NOT EXIST output mkdir output

:: 2. Build Stage (Java)
javac src/java/TransXML.java src/java/TourPackageLister.java

:: 3. Execution: Java (XSLT & DOM Extraction)
java src/java/TransXML
java src/java/TourPackageLister > output\package_list_dom.txt

:: 4. Execution: Python (High-Volume XSLT)
python src/python/TransXML.py src/xsl/tourPackages.xsl packages.html output
python src/python/TransXML.py src/xsl/availableBikes.xsl bikes.html output
python src/python/TransXML.py src/xsl/Routes.xsl paths_by_dest.html output
python src/python/TransXML.py src/xsl/Guides.xsl guides.html output
python src/python/TransXML.py src/xsl/Bookings.XSL bookings_report.html output
python src/python/TransXML.py src/xsl/simpleEvents.xsl events_summary.xml output
python src/python/TransXML.py src/xsl/guideAssignements.xsl package_guides.xml output
python src/python/TransXML.py src/xsl/clientsJSON.xsl clients.json output
python src/python/TransXML.py src/xsl/pathJSON.xsl paths.json output

:: 5. Validation Stage
python src/python/jsonValidator.py > output\clients_validation_status.txt

ECHO [PIPELINE COMPLETE] Generated 12 assets in /output.
PAUSE
Technology StackCore: XML, XPath, XSLT 1.0.Java: javax.xml.transform, org.w3c.dom.Python: lxml (Processing), jsonschema (Validation).Schemas: XSD (XML), Draft-07 (JSON) Output CatalogData TargetFormatBusiness UseInventory DashboardHTMLReal-time rental bike status.Booking ReportHTMLClient schedule management.Path DataJSONMap integration for mobile apps.Event SummaryXMLThird-party calendar syndication.
