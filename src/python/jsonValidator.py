import json
import jsonschema

try:
    # 1. Load the JSON data file 
    with open('output/clients.json', 'r') as f:
        json_data = json.load(f)
    
    # 2. Load the JSON schema file (MUST be in the root directory)
    with open('clients_schema.json', 'r') as f:
        schema = json.load(f)
        
    # 3. Perform Validation using the full module path
    jsonschema.validate(instance=json_data, schema=schema)
    
    # Success message
    print("SUCCESS: output/clients.json is VALID against clients_schema.json.")

except FileNotFoundError as e:
    # Handles the exact error you are seeing (clients_schema.json missing)
    print(f"FAILURE: File Not Found: {e.filename}. Please confirm that the required file is in the 'C:\\Users\\Carbon\\Desktop\\Cycling-tours' directory.")

except json.JSONDecodeError:
    # Handles malformed JSON structure
    print("FAILURE: Invalid JSON syntax in clients.json.")

except Exception as e:
    if 'ValidationError' in str(type(e)):
        # If it's a validation error, report it.
        print(f"FAILURE: JSON Validation Error: {e.message}")
    else:
        # Catch all other unexpected errors (like the AttributeError)
        print(f"FAILURE: An unexpected Python error occurred: {type(e).__name__}: {e}")