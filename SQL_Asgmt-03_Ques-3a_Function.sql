CREATE DEFINER=`root`@`localhost` FUNCTION `Ques-3a_Assignment-3`(Customer_Number integer) RETURNS varchar(20) CHARSET utf8mb4
BEGIN
declare status varchar (20);
declare Total_amt integer;
select sum(amount) into Total_amt from payments where customerNumber = Customer_Number;
	if (Total_amt < 25000) then
    set status = "Silver";
    elseif (Total_amt between 25000 and 50000) then
    set status = "Gold";
    else
    set status = "Platinum";
end if;
RETURN status;
RETURN 1;
END