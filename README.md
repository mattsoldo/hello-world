# README

This README would normally document whatever steps are necessary to get the
application up and running.

## License

This is licensed under the Apache 2.0 license.

## To-Do

## How-To

Setup GKE Cluster(s) (see docs)

Build container

Create services

1. Setup Cloudflare
  2. Add pools. 1 pool for each CR GKE service. Each pool has a single endpoint.
  3. Create load balancer (dynamic) going to each pool.
  4. Create certificate in Cloudflare. Save keys to computer.
  4. Set kubectl to cluster: ```gcloud container clusters get-credentials eu-cluster --zone europe-west1-c --project hello-world-ruby-2019```
  5. Add keys to each service: ```kubectl create --namespace istio-system secret tls istio-ingressgateway-certs --key ../privkey.pem --cert ../fullchain.pem secret "istio-ingressgateway-certs" created```
  6. Create on redis cluster in each region.
  7. Add REDIS-IP ENV var on each service based on the redis clusters created.



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
