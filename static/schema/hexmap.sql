DROP TABLE IF EXISTS map_game1;
CREATE TABLE map_game1 (
`x` INT NOT NULL,
`y` INT NOT NULL,
UNIQUE KEY `hex` (`x`,`y`)
);

DROP TABLE IF EXISTS know_game1;
CREATE TABLE know_game1 (
`player` VARCHAR(32) NOT NULL,
`visible` TEXT,
`explored` TEXT,
`controlled` TEXT
);

DROP TABLE IF EXISTS sites_game1;
CREATE TABLE sites_game1 (
`x` INT NOT NULL,
`y` INT NOT NULL,
`item` VARCHAR(64)
);

DROP TABLE IF EXISTS regions_game1;
CREATE TABLE regions_game1 (
`region_name` VARCHAR(64),
`region_type` VARCHAR(32),
`region_coords` TEXT
);
