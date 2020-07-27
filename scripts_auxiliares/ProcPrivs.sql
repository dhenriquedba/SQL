-- Definitivo
Bom dia, Mário!
Sobre a questão de acesso dos desenvolvedores ao código dos Package Bodies, a seguinte sequencia foi executada, resultando no acesso, para leitura dos respectivos códigos, via TOAD, por exemplo:


conn system@cr9a
Create user odecio identified by odecio
	default tablespace tools
		temporary tablespace temp
/
grant create session to odecio
/
grant select any dictionary to odecio
/

Acredito atender às necessidades, sem violar nenhum princípio de segurança do ABN. Caso contrário, por favor, me avise!


-- final definitivo




conn sys@cr9a
Create user odecio identified by odecio
	default tablespace tools
		temporary tablespace temp
/
grant create session to odecio
/
grant select any dictionary to odecio;

grant select on dba_source to odecio
/
create view odecio.all_source as
	select * from sys.dba_source
/

conn dbamon@cr9a
grant execute on DBAF_PARAMETER_VALUE to odecio;
grant execute on DBAK_CALCULA_VOLUMETRIA to odecio;
grant execute on DBAK_CALCULA_VOLUMETRIA to odecio;
grant execute on DBAK_COLETA to odecio;
grant execute on DBAK_COLETA to odecio;
grant execute on DBAK_ENVIO to odecio;
grant execute on DBAK_ENVIO to odecio;
grant execute on DBAP_MANTEM_AUDITORIA to odecio;

                          
conn sys@cr9a
grant debug any procedure to odecio;
grant select any dictionary to odecio;
revoke CREATE  ANY PROCEDURE from odecio;
revoke ALTER ANY PROCEDURE from odecio;
revoke EXECUTE ANY PROCEDURE from odecio;
revoke DEBUG ANY PROCEDURE from odecio;

select * from session_roles
ROLE                          
------------------------------
DBA                           
SELECT_CATALOG_ROLE           
HS_ADMIN_ROLE                 
EXECUTE_CATALOG_ROLE          
DELETE_CATALOG_ROLE           
EXP_FULL_DATABASE             
IMP_FULL_DATABASE             
GATHER_SYSTEM_STATISTICS      
PLUSTRACE                     
AQ_ADMINISTRATOR_ROLE         
DESENV                        
CONSULTA_FAMAS                
APL_SVC                       
13 rows selected
 
 
select * from session_privs
PRIVILEGE                               
----------------------------------------
ALTER SYSTEM                            
AUDIT SYSTEM                            
CREATE SESSION                          
ALTER SESSION                           
RESTRICTED SESSION                      
CREATE TABLESPACE                       
ALTER TABLESPACE                        
MANAGE TABLESPACE                       
DROP TABLESPACE                         
UNLIMITED TABLESPACE                    
CREATE USER                             
BECOME USER                             
ALTER USER                              
DROP USER                               
CREATE ROLLBACK SEGMENT                 
ALTER ROLLBACK SEGMENT                  
DROP ROLLBACK SEGMENT                   
CREATE TABLE                            
CREATE ANY TABLE                        
ALTER ANY TABLE                         
BACKUP ANY TABLE                        
DROP ANY TABLE                          
LOCK ANY TABLE                          
COMMENT ANY TABLE                       
SELECT ANY TABLE                        
INSERT ANY TABLE                        
UPDATE ANY TABLE                        
DELETE ANY TABLE                        
CREATE CLUSTER                          
CREATE ANY CLUSTER                      
ALTER ANY CLUSTER                       
DROP ANY CLUSTER                        
CREATE RULE                             
CREATE ANY RULE                         
ALTER ANY RULE                          
DROP ANY RULE                           
EXECUTE ANY RULE                        
CREATE ANY INDEX                        
ALTER ANY INDEX                         
DROP ANY INDEX                          
CREATE SYNONYM                          
CREATE ANY SYNONYM                      
DROP ANY SYNONYM                        
CREATE PUBLIC SYNONYM                   
DROP PUBLIC SYNONYM                     
CREATE VIEW                             
CREATE ANY VIEW                         
DROP ANY VIEW                           
CREATE SEQUENCE                         
CREATE ANY SEQUENCE                     
ALTER ANY SEQUENCE                      
DROP ANY SEQUENCE                       
SELECT ANY SEQUENCE                     
CREATE DATABASE LINK                    
CREATE PUBLIC DATABASE LINK             
DROP PUBLIC DATABASE LINK               
CREATE ROLE                             
DROP ANY ROLE                           
GRANT ANY ROLE                          
ALTER ANY ROLE                          
AUDIT ANY                               
ALTER DATABASE                          
FORCE TRANSACTION                       
FORCE ANY TRANSACTION                   
CREATE PROCEDURE                        
CREATE ANY PROCEDURE                    
ALTER ANY PROCEDURE                     
DROP ANY PROCEDURE                      
EXECUTE ANY PROCEDURE                   
CREATE TRIGGER                          
CREATE ANY TRIGGER                      
ALTER ANY TRIGGER                       
DROP ANY TRIGGER                        
CREATE PROFILE                          
ALTER PROFILE                           
DROP PROFILE                            
ALTER RESOURCE COST                     
ANALYZE ANY                             
GRANT ANY PRIVILEGE                     
CREATE SNAPSHOT                         
CREATE ANY SNAPSHOT                     
ALTER ANY SNAPSHOT                      
DROP ANY SNAPSHOT                       
CREATE ANY DIRECTORY                    
DROP ANY DIRECTORY                      
CREATE TYPE                             
CREATE ANY TYPE                         
ALTER ANY TYPE                          
DROP ANY TYPE                           
EXECUTE ANY TYPE                        
UNDER ANY TYPE                          
CREATE LIBRARY                          
CREATE ANY LIBRARY                      
ALTER ANY LIBRARY                       
DROP ANY LIBRARY                        
EXECUTE ANY LIBRARY                     
CREATE OPERATOR                         
CREATE ANY OPERATOR                     
DROP ANY OPERATOR                       
EXECUTE ANY OPERATOR                    
CREATE INDEXTYPE                        
CREATE ANY INDEXTYPE                    
ALTER ANY INDEXTYPE                     
DROP ANY INDEXTYPE                      
UNDER ANY VIEW                          
QUERY REWRITE                           
GLOBAL QUERY REWRITE                    
EXECUTE ANY INDEXTYPE                   
UNDER ANY TABLE                         
CREATE DIMENSION                        
CREATE ANY DIMENSION                    
ALTER ANY DIMENSION                     
DROP ANY DIMENSION                      
MANAGE ANY QUEUE                        
ENQUEUE ANY QUEUE                       
DEQUEUE ANY QUEUE                       
CREATE ANY CONTEXT                      
DROP ANY CONTEXT                        
CREATE ANY OUTLINE                      
ALTER ANY OUTLINE                       
DROP ANY OUTLINE                        
ADMINISTER RESOURCE MANAGER             
ADMINISTER DATABASE TRIGGER             
ON COMMIT REFRESH                       
RESUMABLE                               
SELECT ANY DICTIONARY                   
DEBUG CONNECT SESSION                   
DEBUG ANY PROCEDURE                     
FLASHBACK ANY TABLE                     
GRANT ANY OBJECT PRIVILEGE              
CREATE EVALUATION CONTEXT               
CREATE ANY EVALUATION CONTEXT           
ALTER ANY EVALUATION CONTEXT            
DROP ANY EVALUATION CONTEXT             
EXECUTE ANY EVALUATION CONTEXT          
CREATE RULE SET                         
CREATE ANY RULE SET                     
ALTER ANY RULE SET                      
DROP ANY RULE SET                       
EXECUTE ANY RULE SET                    

