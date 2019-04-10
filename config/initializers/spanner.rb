# Imports the Google Cloud client library
require "google/cloud/spanner"

project_id = "hiworld"
instance_id = "hiworld-spanner"
database_id = "hiworld-database"

spanner = Google::Cloud::Spanner.new project: project_id

# Gets a reference to a Cloud Spanner instance database
$spanner_client = spanner.client instance_id, database_id
