CREATE TABLE posts (
  id STRING(36),
  message STRING(1024),
  url STRING(2048),
  created_at TIMESTAMP OPTIONS (allow_commit_timestamp=true),
  updated_at TIMESTAMP OPTIONS (allow_commit_timestamp=true)
) PRIMARY KEY (id)
