No 11g o hash da senha nao aparece na dba_users.


Utilize o comando abaixo para salvar o hash quando necessário:


SQL> select name, password, astatus from sys.user$ where name  in ('SYSTEM', 'SYS') 
  2  /

NAME                           PASSWORD                          ASTATUS
------------------------------ ------------------------------ ----------
SYS                            D9E99B2C33505444                        0
SYSTEM                         4E737D07B457F1CA                        0