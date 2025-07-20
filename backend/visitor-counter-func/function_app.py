import azure.functions as func
import logging
import os
from azure.cosmos import CosmosClient, exceptions
import json

app = func.FunctionApp()

# Initialize Cosmos DB client only when needed
def get_cosmos_client():
    try:
        COSMOS_URL = os.environ["COSMOS_DB_URL"]
        COSMOS_KEY = os.environ["COSMOS_DB_KEY"]
        
        # Validate the key isn't empty
        if not COSMOS_KEY:
            raise ValueError("Cosmos DB key is empty")
            
        return CosmosClient(COSMOS_URL, COSMOS_KEY)
    except Exception as e:
        logging.error(f"Failed to initialize Cosmos client: {str(e)}")
        raise

@app.route(route="GetResumeCounter", auth_level=func.AuthLevel.ANONYMOUS)
def GetResumeCounter(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    try:
        client = get_cosmos_client()
        database = client.get_database_client("ResumeTerraform")
        container = database.get_container_client("Counter_1")
        
        doc_id = "1"
        
        try:
            counter = container.read_item(item=doc_id, partition_key=doc_id)
            count = counter.get('count', 0) + 1
            counter['count'] = count
            container.replace_item(item=doc_id, body=counter)
        except exceptions.CosmosResourceNotFoundError:
            counter = {
                'id': doc_id,
                'count': 1
            }
            container.create_item(body=counter)
            count = 1

        return func.HttpResponse(
            json.dumps({
                "id": doc_id,
                "count": count,
                "status": "success"
            }),
            status_code=200,
            mimetype="application/json"
        )

    except Exception as e:
        logging.error(f"Error in GetResumeCounter: {str(e)}")
        return func.HttpResponse(
            json.dumps({"error": "Internal server error", "details": str(e)}),
            status_code=500,
            mimetype="application/json"
        )