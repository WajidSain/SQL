CREATE DEFINER=`root`@`localhost` PROCEDURE `SQL_asdmt-03_Ques-02`()
BEGIN
declare lcl_id integer;
declare lcl_cust_no integer;
declare lcl_ord_no integer;
declare lcl_comnt varchar(20);
declare cancellation_cur cursor for select customerNumber, orderNumber, status from orders;
open cancellation_cur;
orderloop:loop
fetch cancellation_cur into lcl_cust_no, lcl_ord_no, lcl_comnt;
if lcl_comnt="Cancelled" then
insert into cancellations values(lcl_id, lcl_cust_no, lcl_ord_no, lcl_comnt);
end if;
end loop orderloop;
close cancellation_cur;

END