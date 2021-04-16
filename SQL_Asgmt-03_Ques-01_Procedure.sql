CREATE DEFINER=`root`@`localhost` PROCEDURE `SQL_Asgmt-03_Ques-01`(Mon_Year varchar (20))
BEGIN
select orderNumber, orderDate, status from orders where Month_Year = Mon_Year;
END