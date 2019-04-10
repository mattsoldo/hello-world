require "shrine/storage/google_cloud_storage"

Shrine.storages = {
  cache: Shrine::Storage::GoogleCloudStorage.new(project: "hiworld", bucket: "hiworld-cache", default_acl: "publicRead"),
  store: Shrine::Storage::GoogleCloudStorage.new(project: "hiworld", bucket: "hiworld.appspot.com", default_acl: "publicRead"),
}
