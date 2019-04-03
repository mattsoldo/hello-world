# README

This README would normally document whatever steps are necessary to get the
application up and running.

## To-Do
0. Geo load balance
1. Redis caching
2. Deploy to two regions

Things you may want to cover:

* Ruby version

* System dependencies

* Using spanner in rails console

require "google/cloud/spanner"

```
project_id = "hello-world-ruby-2019"
spanner = Google::Cloud::Spanner.new project: project_id
instance_id = "global-instance"
database_id = "hello-world"
spanner_db = spanner.client instance_id, database_id

spanner_db.transaction do |transaction|
  results = transaction.execute "SELECT 1"

  results.rows.each do |row|
    puts row
  end
end
```

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
