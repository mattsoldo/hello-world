# Imports the Google Cloud client library
require "google/cloud/spanner"

# Your Google Cloud Platform project ID
project_id = "hello-world-ruby-2019"

# Instantiates a client
spanner = Google::Cloud::Spanner.new project: project_id

# Your Cloud Spanner instance ID
instance_id = "global-instance"

# Your Cloud Spanner database ID
database_id = "hello-world"

# Gets a reference to a Cloud Spanner instance database
$spanner_client = spanner.client instance_id, database_id
