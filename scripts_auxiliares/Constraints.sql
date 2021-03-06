Note:1019469.6 
Subject:  SCRIPT: SCRIPT FOR CAPTURING TABLE CONSTRAINTS 
Type:  SCRIPT 
Status:  PUBLISHED 
 Content Type:  TEXT/PLAIN 
Creation Date:  08-JUL-1996 
Last Revision Date:  07-AUG-2000 
 

====== 
Title: 
====== 
 
Capturing Table Constraints 
 
=========== 
Disclaimer: 
=========== 
 
This script is provided for educational purposes only. It is NOT supported by  
Oracle World Wide Technical Support.  The script has been tested and appears  
to work as intended.However, you should always test any script before  
relying on it. 
 
 
========= 
Abstract: 
========= 
 
The two scripts listed below may be used to capture existing table constraints 
in SQL executable text files. 
 
The first script, "tfsscons.sql", creates an output file that contains  
ALTER TABLE ADD CONSTRAINT statements generated from all existing constraints 
for a given schema. 
 
The second script, "tfstcons.sql", creates an output file that contains 
the ALTER TABLE ADD CONSTRAINT statements for an individual table. 
 
USES: 
 
Potential uses of the scripts include the recreation of constraints or the 
modification of constraint parameters. 
 
For example, if a second table is created using the "AS SELECT" syntax, the 
new table is a duplicate of the first but there are no constraints on the 
new table. An editied copy of the "tfstcons.sql" output file could be used 
to re-name and create the new table's constraints. 
 
The "tfsscons.sql" script may be used as a backup tool for replacing  
constraints that may be accidentially dropped. 
 
The resulting output files may be edited to alter storage parameters for 
primary or unique index keys. 
 
 
============= 
Requirements: 
============= 
 
Privileges to SELECT from objects in the schema. 
 
======= 
Script: 
======= 
 
----------- cut ---------------------- cut -------------- cut -------------- 
SET ECHO off 
REM NAME: tfsscons.sql 
REM USAGE:"@path/tfsscons" 
REM -------------------------------------------------------------------------- 
REM REQUIREMENTS: 
REM SELECT permissions on dba_constraints, dba_cons_columns and 
REM    dba_ind_columns. 
REM -------------------------------------------------------------------------- 
REM AUTHOR: Charles Blakey  
REM         Senior Analyst Gold Support  
REM         Oracle World Wide Technical Support 
REM MAILID: cblakey@us.oracle.com 
REM DATE:   26-MAR-96 
REM -------------------------------------------------------------------------- 
REM PURPOSE: 
REM    The purpose of this script is to generate a file that contains the 
REM    create constraint syntax for all constraints owned by an individual 
REM    user. 
REM 
REM    This script can be used to re-create the constraints after they are 
REM    dropped or may be used to alter constraint parameters. 
REM --------------------------------------------------------------------------- 
REM EXPLANATION: 
REM    The script must be run from SQL*Plus. When executed, it will prompt  
REM    for a schema name (user id), and an EXCEPTIONS table name.  
REM    The script prompts for the user's exception table name.  
REM    If the user does 
REM    not have the exceptions table, just press <ENTER> or <RETURN>. 
REM    The exceptions table may be created using utlexcpt.sql script.   
REM 
REM    The tfsscons.sql script then will create a file in your local  
REM    directory that contains one or more ALTER TABLE ADD CONSTRAINT 
REM    statements. 
REM    The script uses PL/SQL features such as explicit cursors, cursor for 
REM    loops, and the DBMS_OUTPUT.PUT_LINE package procedure. This procedure 
REM    is used to capture the constraint details that are eventually written 
REM    to the file.  The output file is named "schema_cons_schemaname.lst"  
REM    on Unix and ".lis" on VMS machines. The schemaname is the same as the 
REM    interactive prompted value. 
REM --------------------------------------------------------------------------- 
REM    EXAMPLE: 
REM    SQL>@$HOME/tfsscons <cr> 
REM    Enter the schema name: cblakey <cr> 
REM    Enter the EXCEPTIONS table name for schema CBLAKEY: exceptions <cr> 
REM    Note: Creation of the script will take some time... be patient. 
REM    ALTER TABLE ... 
REM    ... 
REM    SQL>  
REM --------------------------------------------------------------------------- 
REM GOTCHA: 
REM    There is a limit to the number of lines that may be retreived by the 
REM    PL/SQL DBMS_OUTPUT.PUT_LINE procedure. I set the buffer in the script  
REM    to its maximum of 1,000,000. 
REM    This value may be too small if there are a great many tables and a  
REM    great many constraints. If you get a buffer overflow error, you will 
REM    have to run the companion script: tfstcons.sql. 
REM    This will limit the output to a single table at a time. 
REM 
REM    Do write a script that will drop all constraints from your table. If a 
REM    column was modified using the "ALTER TABLE MODIFY colname NOT NULL;", 
REM    Or 
REM    The column was declared NOT NULL during table create this script will 
REM    NOT replace them. 
REM    Oracle creates a named constraint for this condition such as 	     
REM    SYS_C000?. 
REM    A describe on the table shows these columns as NOT NULL.  
REM    The tfsscons.sql script will not replace these constraints.  
REM    If it did add them back, the NOT NULL would not reappear in the  
REM    describe 
REM    command but, the NOT NULL for the column would be enforced. 
REM    To work around this condition, create all NOT NUll columns using named 
REM    constraints. These named constraints will be re-created by the script. 
REM -------------------------------------------------------------------------- 
REM REFERENCES: 
REM    Oracle7 SQL*Plus User's Guide and Reference 
REM            set, accept, prompt and spool commands 
REM    Oracle7 PL/SQL User's Guide and Reference  
REM            cursors, if/then/else, "for" loops 
REM    Oracle7 Server SQL Language Reference Guide 
REM            select, from, where clauses 
REM    Oracle7 Server Application Developer's Guide 
REM   dbms_output package 
REM -------------------------------------------------------------------------- 
REM DISCLAIMER: 
REM    This script is provided for educational purposes only. It is NOT  
REM    supported by Oracle World Wide Technical Support. 
REM    The script has been tested and appears to work as intended. 
REM -------------------------------------------------------------------------- 
REM COMMENTS: 
REM If you know how to improve the script let me know.  
 
SET ARRAYSIZE 1 
SET FEEDBACK off 
SET SERVEROUT on 
SET PAGESIZE 66 
SET NEWPAGE 6 
SET LINESIZE 75 
SET PAUSE off 
SET VERIFY off 
ACCEPT puser PROMPT 'Enter the schema name: ' 
ACCEPT pexcp PROMPT 'Enter the EXCEPTIONS table name for schema &puser: ' 
PROMPT 'NOTE: This will take some time, please wait...' 
 
SPOOL schema_cons_&puser 
DECLARE 
	CURSOR cons_cur (v_userid VARCHAR2) IS 
	  SELECT * FROM dba_constraints 
	  WHERE owner = v_userid 
	    AND constraint_type in ('P','U','C','R') 
	  ORDER BY constraint_type; 
	CURSOR col_cur (con_name VARCHAR2, con_owner VARCHAR2) IS 
	  SELECT * FROM dba_cons_columns 
	  WHERE owner = con_owner 
	    AND constraint_name = con_name 
	  ORDER BY position; 
	CURSOR indx_cur (con_name VARCHAR2, ind_own VARCHAR2) IS 
	  SELECT a.* 
	  FROM dba_indexes a, dba_ind_columns b, dba_cons_columns c 
	  WHERE c.constraint_name = con_name 
            AND a.owner = ind_own 
         AND b.index_owner = ind_own 
	    AND c.owner = b.index_owner 
	    AND c.position = 1 
	    AND c.table_name = b.table_name 
	    AND c.column_name = b.column_name 
	    AND b.index_name = a.index_name; 
	col_str	VARCHAR2(200); 
	v_user		VARCHAR2(30) := UPPER('&puser'); 
	v_output	VARCHAR2(480);    -- max of 16 cols at 30 chars each 
        v_excp          NUMBER(1) := 0; 
        v_excptab VARCHAR2(60) := NULL; 
	v_delrule	VARCHAR2(4); 
	v_status	VARCHAR2(4); 
	srch_cond	VARCHAR2(1000); 
	v_errcode       NUMBER := 0; 
        v_errmsg        varchar2(50) := ' '; 
BEGIN 
  DBMS_OUTPUT.ENABLE(1000000);         -- Prevents buffer exceeded error 
  BEGIN 
     v_excptab := UPPER('&pexcp'); 
     IF v_excptab IS NOT NULL THEN 
        SELECT 1 
          INTO v_excp 
        FROM dba_objects 
 WHERE owner = UPPER('&puser') 
        AND   object_name = UPPER('&pexcp'); 
    v_excptab := 'EXCEPTIONS INTO '||LOWER('&pexcp'); 
     END IF; 
     EXCEPTION 
     WHEN NO_DATA_FOUND THEN 
     DBMS_OUTPUT.PUT_LINE('Exceptions table does not exist in the schema: '); 
     RAISE NO_DATA_FOUND; 
     GOTO err; 
  END; 
  FOR c1 IN cons_cur(v_user) LOOP 
   begin 
    srch_cond := substr(c1.search_condition,1,length(c1.search_condition)); 
    -- Dont remove table constraint NOT NULL 
    IF (instr(srch_cond,'NOT NULL') < 1) or 
       (instr(srch_cond,'NOT NULL') IS NULL) THEN 
     BEGIN 
      DBMS_OUTPUT.PUT_LINE('ALTER TABLE '||C1.OWNER||'.'||C1.TABLE_NAME); 
      DBMS_OUTPUT.PUT_LINE('  ADD (CONSTRAINT '||C1.CONSTRAINT_NAME); 
 
      IF c1.constraint_type = 'P' THEN v_output := '    PRIMARY KEY ('; 
      ELSIF c1.constraint_type = 'R' THEN v_output := '    FOREIGN KEY ('; 
    ELSIF c1.constraint_type = 'U' THEN v_output := '    UNIQUE ('; 
      ELSIF c1.constraint_type = 'C' THEN 
         v_output := '    CHECK ('||c1.search_condition||') '||v_excptab; 
      END IF; 
 
      FOR c2 IN col_cur(c1.constraint_name, c1.owner) LOOP 
	IF c2.position = 1 THEN 
	  v_output := v_output||c2.column_name; 
	ELSIF c2.position > 1 THEN 
	  v_output := v_output||', '||c2.column_name; 
	END IF; 
      END LOOP; 
      v_output := v_output||')';  
      DBMS_OUTPUT.PUT_LINE(v_output); 
      IF c1.constraint_type = 'R' THEN 
	v_output := NULL; 
	FOR c3 IN col_cur(c1.r_constraint_name, c1.r_owner) LOOP 
	  IF c3.position = 1 THEN 
	    v_output := '    REFERENCES '||c3.owner||'.'||c3.table_name||'('; 
	    v_output := v_output||c3.column_name; 
	  ELSIF c3.position > 1 THEN 
	    v_output := v_output||', '||c3.column_name; 
	  END IF; 
	END LOOP; 
	v_output := v_output||')'; 
        DBMS_OUTPUT.PUT_LINE(v_output); 
	v_delrule := substr(c1.delete_rule,1,2); 
	IF v_delrule IS NULL THEN v_output := v_excptab ||  ' )'; 
	ELSIF v_delrule = 'NO' THEN v_output :=  v_excptab || ' )'; 
	ELSIF v_delrule = 'CA' THEN v_output := ' ON DELETE CASCADE  
'||v_excptab 
 || ')'; 
	END IF; 
        DBMS_OUTPUT.PUT_LINE(v_output); 
      END IF; 
 
      FOR c4 IN indx_cur(c1.constraint_name, c1.owner) LOOP 
	IF c1.constraint_type in ('P','U') THEN 
          DBMS_OUTPUT.PUT_LINE(' USING INDEX ');   
	  DBMS_OUTPUT.PUT_LINE('   pctfree       '||c4.pct_free); 
	  DBMS_OUTPUT.PUT_LINE('   initrans      '||c4.ini_trans); 
	  DBMS_OUTPUT.PUT_LINE('   maxtrans      '||c4.max_trans); 
	  DBMS_OUTPUT.PUT_LINE('   tablespace    '||c4.tablespace_name); 
	  DBMS_OUTPUT.PUT_LINE(' Storage ('); 
	  DBMS_OUTPUT.PUT_LINE('   initial        '||c4.initial_extent); 
	  DBMS_OUTPUT.PUT_LINE('   next           '||c4.next_extent); 
	  DBMS_OUTPUT.PUT_LINE('   minextents'||c4.min_extents); 
	  DBMS_OUTPUT.PUT_LINE('   maxextents     '||c4.max_extents); 
	  DBMS_OUTPUT.PUT_LINE('   pctincrease    '||c4.pct_increase||') '|| 
v_excptab ||')');  
 
	END IF; 
      END LOOP; 
 
      v_output := NULL; 
      v_status := substr(c1.status,1,1); 
      IF v_status = 'E' THEN  
      v_output := ' REM This constraint '||c1.constraint_name||' was ENABLED'; 
      ELSIF v_status = 'D' THEN  
      v_output :=' REM This constraint '||c1.constraint_name ||' was  
DISABLED';  
      END IF; 
      DBMS_OUTPUT.PUT_LINE('/ '); 
      DBMS_OUTPUT.PUT_LINE(v_output); 
      DBMS_OUTPUT.PUT_LINE('-------------------------------------------- '); 
      DBMS_OUTPUT.PUT_LINE('  '); 
     END; 
   END IF; 
   EXCEPTION 
     WHEN no_data_found THEN 
       DBMS_OUTPUT.PUT_LINE('No Data Found'); 
     WHEN others THEN 
       v_errcode := sqlcode; 
       v_errmsg := SUBSTR(sqlerrm, 1, 50); 
       DBMS_OUTPUT.PUT_LINE('ERROR: '||v_errcode||': ' || v_errmsg); 
    DBMS_OUTPUT.PUT_LINE(c1.constraint_name||' '||c1.constraint_type); 
       DBMS_OUTPUT.PUT_LINE(c1.search_condition); 
   END; 
  END LOOP; 
  <<err>> 
  NULL; 
END; 
/ 
SPOOL off 
SET PAGESIZE 14 
SET FEEDBACK on 
SET NEWPAGE 0 
SET ARRAYSIZE 20 
SET SERVEROUT off 
SET LINESIZE 79 
SET VERIFY on 
 
 
------------ cut ---------------- cut --------------- cut -------------------- 
 
SET ECHO off 
REM NAME: tfstcons.sql 
REM USAGE:"@path/tfstcons"  
REM -------------------------------------------------------------------------- 
REM REQUIREMENTS:  
REM    SELECT permissions on dba_constraints, dba_cons_columns and 
REM    dba_ind_columns. 
REM -------------------------------------------------------------------------- 
REM AUTHOR: Charles Blakey  
REM         Senior Analyst Gold Support  
REM         Oracle World Wide Technical Support 
REM MAILID: cblakey@us.oracle.com 
REM DATE:   26-MAR-96 
REM -------------------------------------------------------------------------- 
REM PURPOSE: 
REM    Create a complete listing of TABLE constraints in an output file. 
REM    The purpose of this script is to generate a file that contains the 
REM    create constraint syntax for all constraints owned by an individual  
REM    user on a specified table. 
REM    This output of this script may be used to re-create the constraints  
REM    after they are dropped or may be used to alter constraint parameters. 
REM --------------------------------------------------------------------------- 
REM EXPLANATION: 
REM    The script must be run from SQL*Plus. When executed, it will prompt for 
REM    a schema name (user id), a table name, and an EXCEPTIONS table name. 
REM    The script prompts for the user's exception table name. If the user does 
REM    not have the exceptions table, just press <ENTER> or <RETURN>. 
REM    The exceptions table may be created using utlexcpt.sql script. 
REM 
REM    The tfsscons.sql script then will create a file in your local 
REM    directory that contains one or more ALTER TABLE ADD CONSTRAINT  
REM    statements. 
REM  
REM    The script uses PL/SQL features such as explicit cursors, cursor for  
REM    loops, and the DBMS_OUTPUT.PUT_LINE package procedure. This procedure 
REM    is used to capture the constraint details that are eventually written  
REM    to the file. 
REM    The output file is named "tab_cons_tablename.lst" on Unix and ".lis" on 
REM    VMS machines. The tablename is the same as the interactive prompted 
REM    value. 
REM --------------------------------------------------------------------------- 
REM EXAMPLE: 
REM    SQL>@$HOME/tfstcons <cr> 
REM    Enter the schema name: cblakey <cr> 
REM    Enter the table name: newemp <cr> 
REM    Enter the EXCEPTIONS table name for schema CBLAKEY: exceptions <cr> 
REM    Note: Creation of the script will take some time... be patient. 
REM    ALTER TABLE NEWEMP ... 
REM    ... 
REM    SQL>  
REM --------------------------------------------------------------------------- 
REM GOTCHA: 
REM    There is a limit to the number of lines that may be retreived by the 
REM    PL/SQL DBMS_OUTPUT.PUT_LINE procedure. I have set the buffer in the  
REM    script tto its maximum of 1,000,000.  
REM  
REM    Do write a script that will drop all constraints from your table. If a 
REM    column was modified using "ALTER TABLE MODIFY colname NOT NULL;", Or the 
REM    column was declared NOT NULL during table create, the script will NOT 
REM    replace them. 
REM    Oracle creates a named constraint for this condition such as SYS_C000?. 
REM    A describe on the table shows these columns as NOT NULL. The  
REM    tfstcons.sql script will not replace these constraints. If it did  
REM    add them back, the NOT NULL would not reappear in the describe command. 
REM    To work around this condition, create all NOT NUll columns using named 
REM    constraints. These named constraints will be re-created by the script. 
REM -------------------------------------------------------------------------- 
REM REFERENCES: 
REM    Oracle7 SQL*Plus User's Guide and Reference 
REM            set, accept, prompt and spool commands 
REM    Oracle7 PL/SQL User's Guide and Reference  
REM            cursors, if/then/else, "for" loops 
REM    Oracle7 Server SQL Language Reference Guide 
REM            select, from, where clauses, constraints, exceptions into clause 
REM    Oracle7 Server Application Developer's Guide 
REM            dbms_output package 
REM -------------------------------------------------------------------------- 
REM DISCLAIMER: 
REM    This script is provided for educational purposes only. It is NOT  
REM    supported by Oracle World Wide Technical Support. 
REM    The script has been tested and appears to work as intended. 
REM    If you elect to use it, test it throughly. You use it at your own risk. 
REM -------------------------------------------------------------------------- 
REM COMMENTS: 
REM If you know how to improve the script let me know.  
 
SET ARRAYSIZE 1 
SET SERVEROUT on 
SET PAGESIZE 66 
SET NEWPAGE 6 
SET LINESIZE 75 
SET PAUSE off 
SET VERIFY off 
SET FEEDBACK off 
ACCEPT puser PROMPT 'Enter the schema name: ' 
ACCEPT ptab  PROMPT 'Enter the table name: ' 
ACCEPT pexcp PROMPT 'Enter the EXCEPTIONS table name for schema &puser: ' 
PROMPT 'NOTE: This will take some time, please be patient...' 
 
SPOOL tab_cons_&ptab 
DECLARE 
	CURSOR cons_cur (v_userid VARCHAR2, v_tabname VARCHAR2) IS 
	  SELECT * FROM sys.dba_constraints 
	  WHERE owner = v_userid 
	    AND constraint_type in ('P','U','C','R') 
            AND table_name = v_tabname 
	  ORDER BY constraint_type; 
	CURSOR col_cur (con_name VARCHAR2, con_owner VARCHAR2) IS 
	  SELECT * FROM sys.dba_cons_columns 
	  WHERE owner = con_owner 
	    AND constraint_name = con_name 
	  ORDER BY position; 
	CURSOR indx_cur (con_name VARCHAR2, ind_own VARCHAR2) IS 
	  SELECT a.* 
	  FROM sys.dba_indexes a, sys.dba_ind_columns b, sys.dba_cons_columns c 
	WHERE c.constraint_name = con_name 
            AND a.owner = ind_own 
 AND b.index_owner = ind_own 
	    AND c.owner = b.index_owner 
	    AND c.position = 1 
	    AND c.table_name = b.table_name 
	    AND c.column_name = b.column_name 
	    AND b.index_name = a.index_name; 
	col_str	VARCHAR2(200); 
	v_user		VARCHAR2(30) := UPPER('&puser'); 
        v_tabname       VARCHAR2(30) := UPPER('&ptab'); 
	v_output	VARCHAR2(480);    -- max of 16 cols at 30 chars each 
        v_dummy         NUMBER := 0; 
	v_delrule	VARCHAR2(4); 
	v_status	VARCHAR2(4); 
        v_excp          NUMBER(1) := 0; 
	v_excptab       VARCHAR2(60) := NULL;  
	srch_cond	VARCHAR2(1000); 
BEGIN 
  DBMS_OUTPUT.ENABLE(1000000);         -- Prevents buffer exceeded error 
 
  SELECT 1                             -- Check to see if the table exists 
  INTO v_dummy 
  FROM dba_tables 
  WHERE table_name = v_tabname 
  AND   owner = v_user; 
  BEGIN 
     v_excptab := UPPER('&pexcp'); 
     IF v_excptab IS NOT NULL THEN 
        SELECT 1 
          INTO v_excp 
        FROM sys.dba_objects 
        WHERE owner = UPPER('&puser') 
        AND   object_name = UPPER('&pexcp'); 
        v_excptab := 'EXCEPTIONS INTO '||LOWER('&pexcp'); 
     END IF; 
     EXCEPTION 
     WHEN NO_DATA_FOUND THEN 
     DBMS_OUTPUT.PUT_LINE('Exceptions table does not exist in your schema: '); 
     RAISE NO_DATA_FOUND; 
     GOTO err; 
  END; 
  FOR c1 IN cons_cur(v_user, v_tabname) LOOP 
   begin 
    srch_cond := substr(c1.search_condition,1,length(c1.search_condition)); 
    -- Dont remove table constraint NOT NULL 
    IF (instr(srch_cond,'NOT NULL') < 1) or 
       (instr(srch_cond,'NOT NULL') IS NULL) THEN 
     BEGIN 
      DBMS_OUTPUT.PUT_LINE('ALTER TABLE '||C1.OWNER||'.'||C1.TABLE_NAME); 
      DBMS_OUTPUT.PUT_LINE('  ADD (CONSTRAINT '||C1.CONSTRAINT_NAME); 
 
      IF c1.constraint_type = 'P' THEN v_output := '    PRIMARY KEY ('; 
      ELSIF c1.constraint_type = 'R' THEN v_output := '    FOREIGN KEY ('; 
      ELSIF c1.constraint_type = 'U' THEN v_output := ' UNIQUE ('; 
      ELSIF c1.constraint_type = 'C' THEN 
	v_output := '    CHECK ('||c1.search_condition||') '||v_excptab; 
      END IF; 
 
      FOR c2 IN col_cur(c1.constraint_name, c1.owner) LOOP 
	IF c2.position = 1 THEN 
	  v_output := v_output||c2.column_name; 
	ELSIF c2.position > 1 THEN 
	  v_output := v_output||', '||c2.column_name; 
	END IF; 
      END LOOP; 
      v_output := v_output ||')';  
 DBMS_OUTPUT.PUT_LINE(v_output); 
      IF c1.constraint_type = 'R' THEN 
	v_output := NULL; 
	FOR c3 IN col_cur(c1.r_constraint_name, c1.r_owner) LOOP 
	  IF c3.position = 1 THEN 
	    v_output := '    REFERENCES '||c3.owner||'.'||c3.table_name||'('; 
	    v_output := v_output||c3.column_name; 
	  ELSIF c3.position > 1 THEN 
	    v_output := v_output||', '||c3.column_name; 
	  END IF; 
	END LOOP; 
	v_output := v_output||') '; 
        DBMS_OUTPUT.PUT_LINE(v_output); 
	v_delrule := substr(c1.delete_rule,1,2); 
	IF v_delrule IS NULL THEN v_output :=  v_excptab ||' )'; 
	ELSIF v_delrule = 'NO' THEN v_output := v_excptab || ' )'; 
	ELSIF v_delrule = 'CA' THEN v_output := ' ON DELETE CASCADE  
'||v_excptab || ')'; 
	END IF; 
DBMS_OUTPUT.PUT_LINE(v_output); 
      END IF; 
 
      FOR c4 IN indx_cur(c1.constraint_name, c1.owner) LOOP 
	IF c1.constraint_type in ('P','U') THEN 
          DBMS_OUTPUT.PUT_LINE(' USING INDEX ');    
	  DBMS_OUTPUT.PUT_LINE('   pctfree  '||c4.pct_free); 
	  DBMS_OUTPUT.PUT_LINE('   initrans      '||c4.ini_trans); 
	  DBMS_OUTPUT.PUT_LINE('   maxtrans      '||c4.max_trans); 
	  DBMS_OUTPUT.PUT_LINE('   tablespace    '||c4.tablespace_name); 
	  DBMS_OUTPUT.PUT_LINE(' Storage ('); 
	  DBMS_OUTPUT.PUT_LINE('   initial        '||c4.initial_extent); 
	  DBMS_OUTPUT.PUT_LINE('   next           '||c4.next_extent); 
	  DBMS_OUTPUT.PUT_LINE(' minextents     '||c4.min_extents); 
	  DBMS_OUTPUT.PUT_LINE('   maxextents     '||c4.max_extents); 
	  DBMS_OUTPUT.PUT_LINE('   pctincrease    '||c4.pct_increase||') '|| 
v_excptab ||')'); 
	END IF; 
      END LOOP; 
 
      v_output := NULL; 
   v_status := substr(c1.status,1,1); 
      IF v_status = 'E' THEN  
      v_output := ' REM This constraint '||c1.constraint_name||' was ENABLED'; 
      ELSIF v_status = 'D' THEN  
      v_output :=' REM This constraint '||c1.constraint_name ||' was  
DISABLED';  
      END IF; 
      DBMS_OUTPUT.PUT_LINE('/ '); 
      DBMS_OUTPUT.PUT_LINE(v_output); 
      DBMS_OUTPUT.PUT_LINE('-------------------------------------------- '); 
      DBMS_OUTPUT.PUT_LINE(' '); 
     END; 
   END IF; 
   EXCEPTION 
     WHEN no_data_found THEN 
       DBMS_OUTPUT.PUT_LINE('No Data Found'); 
     WHEN others THEN 
       DBMS_OUTPUT.PUT_LINE('Other: '||substr(sqlerrm,1,60)); 
       DBMS_OUTPUT.PUT_LINE(c1.constraint_name||' '||c1.constraint_type); 
       DBMS_OUTPUT.PUT_LINE(c1.search_condition); 
   END; 
  END LOOP; 
  <<err>> 
  NULL; 
EXCEPTION 
WHEN no_data_found THEN 
DBMS_OUTPUT.PUT_LINE('This table: '||v_tabname||', Does not exist or has no  
constraints!'); 
END; 
/ 
SPOOL off 
SET PAGESIZE 14 
SET FEEDBACK on 
SET NEWPAGE 0 
SET ARRAYSIZE 20 
SET SERVEROUT off 
SET LINESIZE 79 
SET VERIFY on 
 
 
----------- cut ---------------------- cut -------------- cut -------------- 
 
 
========= 
Examples: 
========= 
 
Here is "schema_cons_ernie.lst". 
 
 
ALTER TABLE ERNIE.NEWEMP           
ADD (CONSTRAINT NEWEMP_SALARY_CK       
CHECK (salary >= 0) EXCEPTIONS INTO exceptions)   
/                                                                           
REM This constraint NEWEMP_SALARY_CK was ENABLED                            
--------------------------------------------                                
ALTER TABLE ERNIE.DEPT                                                      
ADD (CONSTRAINT DEPT_DEPTNO_PK                                              
PRIMARY KEY (DEPTNO)                                                        
USING INDEX                                                       
pctfree       10                                                   
initrans      2                                               
maxtrans      255                                           
tablespace    SYSTEM                                       
Storage (                                   
initial        10240                               
next           10240                           
minextents     1                       
maxextents     121                   
pctincrease    50) EXCEPTIONS INTO exceptions)               
/           
REM This constraint DEPT_DEPTNO_PK was ENABLED       
--------------------------------------------   
ALTER TABLE ERNIE.NEWEMP                                                    
ADD (CONSTRAINT NEWEMP_ID_PK                                                
PRIMARY KEY (ID)                                                            
USING INDEX                                                                 
pctfree 5                                                             
initrans      2                                                           
maxtrans      255                                                       
tablespace    TOOLS                                                   
Storage (                                               
initial        51200                                           
next           51200                                       
minextents     1                                   
maxextents     121                               
pctincrease    0) EXCEPTIONS INTO exceptions)                           
/                       
REM This constraint NEWEMP_ID_PK was ENABLED                   
--------------------------------------------               
ALTER TABLE ERNIE.NEWEMP           
ADD (CONSTRAINT NEWEMP_DEPTNO_FK       
FOREIGN KEY (DEPTNO)   
REFERENCES ERNIE.DEPT(DEPTNO)                                               
ON DELETE CASCADE EXCEPTIONS INTO exceptions)                               
/                                                                       
REM This constraint NEWEMP_DEPTNO_FK was ENABLED                            
--------------------------------------------                                
ALTER TABLE ERNIE.NEWEMP                                                    
ADD (CONSTRAINT NEWEMP_MANAGER_ID_FK                                        
FOREIGN KEY (MANAGER_ID)                                                    
REFERENCES ERNIE.NEWEMP(ID)                                               
EXCEPTIONS INTO exceptions )                                           
/                                       
REM This constraint NEWEMP_MANAGER_ID_FK was ENABLED                        
--------------------------------------------                                
ALTER TABLE ERNIE.NEWEMP                           
ADD (CONSTRAINT NEWEMP_USERID_UK                       
UNIQUE (USERID)                   
USING INDEX               
pctfree       5           
initrans      2       
maxtrans      255   
tablespace    TOOLS                                                         
Storage (                                                                   
initial        51200                                                        
next      51200                                                        
minextents  1                                                            
maxextents     121                                                          
pctincrease    0) EXCEPTIONS INTO exceptions)                               
/                                                   
REM This constraint NEWEMP_USERID_UK was ENABLED                            
--------------------------------------------                                
 
Here is "tab_cons_chktab.lst". 
 
 
ALTER TABLE CBLAKEY.CHKTAB                                                  
ADD (CONSTRAINT CHK_COL1_VAL                                                
CHECK ( col1 = TRANSLATE(                                                   
col1,'*`~!@#$%^&()-_=+[{]};:"\|/?.>,<<>','!******************************** 
*') ) EXCEPTIONS INTO exceptions)                                           
/                                                     
REM This constraint CHK_COL1_VAL was ENABLED                                
--------------------------------------------                                
ALTER TABLE CBLAKEY.CHKTAB                                         
ADD (CONSTRAINT CHKTAB_COL_PK                                     
PRIMARY KEY (COL1, COL2)                                 
USING INDEX                             
pctfree       10                         
initrans      2                     
maxtrans      255                 
tablespace    USERS             
Storage (         
initial        10240     
next           10240 
minextents     1                                                            
maxextents     121                                                          
pctincrease    50) EXCEPTIONS INTO exceptions)                              
/                                                                 
REM This constraint CHKTAB_COL_PK was ENABLED                               
--------------------------------------------
.

 

--------------------------------------------------------------------------------
 
 Copyright (c) 1995,2000 Oracle Corporation. All Rights Reserved. Legal Notices and Terms of Use.  

