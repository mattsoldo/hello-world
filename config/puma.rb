# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
#

# threads_count = ENV.fetch("RAILS_MAX_THREADS") { 1 }
# threads threads_count, threads_count
threads 1, 1
# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
#
port        ENV.fetch("PORT") { 3000 }

# Specifies the `environment` that Puma will run in.
#
environment ENV.fetch("RAILS_ENV") { "development" }

# Specifies the number of `workers` to boot in clustered mode.
# Workers are forked webserver processes. If using threads and workers together
# the concurrency of the application would be max `threads` * `workers`.
# Workers do not work on JRuby or Windows (both of which do not support
# processes).
#
# workers ENV.fetch("WEB_CONCURRENCY") { 0 }
workers 0
# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory.
#
# preload_app!

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart

# on_worker_boot do
#   $foo = 1
# end

# on_worker_boot do
#   # require "google/cloud/spanner"
#
#   # Your Google Cloud Platform project ID
#   project_id = "hello-world-ruby-2019"
#
#   # Instantiates a client
#   spanner = Google::Cloud::Spanner.new project: project_id
#
#   # Your Cloud Spanner instance ID
#   instance_id = "global-instance"
#
#   # Your Cloud Spanner database ID
#   database_id = "hello-world"
#
#   # Gets a reference to a Cloud Spanner instance database
#   $foo = spanner.client instance_id, database_id
# end
