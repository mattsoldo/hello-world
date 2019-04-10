CREATE TABLE active_storage_attachments (
  id STRING(36) NOT NULL,
  name STRING(2048),
  record_type STRING(128),
  recored_id STRING(36),
  blob_id STRING(36),
  created_at TIMESTAMP OPTIONS (allow_commit_timestamp=true)
) PRIMARY KEY (id),
INTERLEAVE IN PARENT active_storage_blobs ON DELETE CASCADE;
