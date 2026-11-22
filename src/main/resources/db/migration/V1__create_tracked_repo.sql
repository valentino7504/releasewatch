-- Create the tracked repo table
CREATE TABLE IF NOT EXISTS tracked_repo (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  owner VARCHAR(39) NOT NULL,
  name VARCHAR(100) NOT NULL,
  etag TEXT,
  last_polled_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE,
  last_poll_status VARCHAR(32),
  UNIQUE(owner, name),
  CONSTRAINT ck_tracked_repo_last_poll_status
      CHECK (last_poll_status IN ('SUCCESS', 'NOT_MODIFIED', 'NOT_FOUND', 'RATE_LIMITED', 'FAILED'))
)