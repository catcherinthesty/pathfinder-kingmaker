DROP TABLE IF EXISTS `ALIGNMENT`;
CREATE TABLE `ALIGNMENT` (
    moral varchar(12),
    ethical varchar(12),
    bonus varchar(12)
);
INSERT INTO `ALIGNMENT` (moral, ethical, bonus) VALUES
("Good", "Chaotic", "Loyalty"),
("Evil", "Lawful", "Stability"),
("Neutral", "Neutral", "Economy");
