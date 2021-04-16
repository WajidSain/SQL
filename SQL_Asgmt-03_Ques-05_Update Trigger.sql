CREATE DEFINER=`root`@`localhost` TRIGGER `movies_BEFORE_UPDATE` BEFORE UPDATE ON `movies` FOR EACH ROW BEGIN
update rentals set movieid = new.id where movieid = old.id;
END