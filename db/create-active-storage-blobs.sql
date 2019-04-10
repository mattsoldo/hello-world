CREATE TABLE active_storage_blobs (
  key STRING(36) NOT NULL,
  filename STRING(2048),
  content_type STRING(256),
  metadata STRING(2048),
  byte_size INT64,
  checksum STRING(128),
  created_at TIMESTAMP OPTIONS (allow_commit_timestamp=true)
) PRIMARY KEY (key)
