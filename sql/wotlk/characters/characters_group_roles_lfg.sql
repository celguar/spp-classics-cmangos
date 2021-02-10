-- Group roles support
ALTER TABLE group_member ADD COLUMN roles 
TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Member roles bit mask'
AFTER subgroup;
