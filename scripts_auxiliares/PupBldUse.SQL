insert into PRODUCT_USER_PROFILE
(PRODUCT, USERID , ATTRIBUTE, CHAR_VALUE)
values
('SQL*Plus', 'PUBLIC', 'ROLES', 'TESTE')
/

create user x identified by x;
create role teste;
grant teste to x;
grant dba to teste;

/*
Note: When you enter "PUBLIC" or "%" for the Userid column, you disable the role for all users. 
You should only use "%" or "PUBLIC" for roles which are granted to "PUBLIC". 
If you try to disable a role that has not been granted to a user, none of the roles for that user are disabled.
*/

