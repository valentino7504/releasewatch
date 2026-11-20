-- Create the tracked repo table
CREATE TABLE IF NOT EXISTS tracked_repos (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  owner VARCHAR(39) NOT NULL,
  name VARCHAR(100) NOT NULL,
  etag TEXT,
  last_polled_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE,
  UNIQUE(owner, name)
)