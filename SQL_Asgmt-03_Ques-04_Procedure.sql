CREATE DEFINER=`root`@`localhost` PROCEDURE `SQL_Asgmt=03_Ques-04`()
BEGIN
declare finished, cnum integer default 0;
    declare crlimit, uplimit decimal(10,2) default 0.0;
    declare pstatus varchar(10) default '';
    
    declare credit_cur cursor for
	select customerNumber, creditlimit, purchase_status(customerNumber) 
    from customers
    where purchase_status(customerNumber) in ('platinum','gold');
    
    declare exit handler for NOT FOUND SET finished = 1;
    declare continue handler for SQLSTATE '45000'
    BEGIN
        Select concat("Updating ", cnum, " -> ", uplimit) as Message;
		update customers 
        set creditlimit = uplimit
        where customernumber = cnum;
    END;
    
    open credit_cur;
    creditloop: REPEAT
      fetch credit_cur into cnum, crlimit, pstatus;
      if pstatus = 'platinum' and crlimit < 40000 then
			set uplimit = 100000;
			signal sqlstate '45000';
	  elseif pstatus = 'gold' and crlimit > 60000 then
            set uplimit= 60000;
            signal sqlstate '45000';
	  else 
            iterate creditloop;
	  end if ;
            
    until finished = 1
    end repeat creditloop;

END