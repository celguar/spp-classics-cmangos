ALTER TABLE ai_playerbot_db_store
ADD COLUMN preset VARCHAR(32)
AFTER guid;