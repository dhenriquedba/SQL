drop TABLE EXCEPTIONS;
CREATE TABLE EXCEPTIONS (ROW_ID UROWID, OWNER 
    VARCHAR2(30), TABLE_NAME VARCHAR2(30), CONSTRAINT VARCHAR2(30)) 
    PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 LOGGING 
   TABLESPACE dat02  storage( initial 8064 next 8064 pctincrease 0 maxextents unlimited) ;

create table a (a number primary key)
  organization index;


create table b  (b number primary key, c number)
  organization index;


insert into a values(1);

insert into b values(1,1);
insert into b values(2,2);

alter table b add constraint r_b_a
    foreign key (B) references a(a);

--ERRO na linha 1:
--ORA-02298: não é possível validar (MIGRACAO.R_B_A) - chaves-pai não localizadas


alter table b add constraint r_b_a
    foreign key (B) references a(a)
 exceptions into exceptions;
--ERRO na linha 1:
--ORA-02298: não é possível validar (MIGRACAO.R_B_A) - chaves-pai não localizadas


--select * from exceptions;
--ROW_ID
------------------------------------------------------------------------------------------------------
--OWNER                          TABLE_NAME                     CONSTRAINT
-------------------------------- ------------------------------ ------------------------------
--*BAFBCqMCwQP+
--MIGRACAO                       B                              R_B_A


create table c (a number primary key)
/

create table d  (b number primary key, c number)
/

insert into c values(1);

insert into d values(1,1);
insert into d values(2,2);

alter table d add constraint r_d_c
    foreign key (B) references c(a)
    exceptions into exceptions;

--ERRO na linha 1:
--ORA-02298: não é possível validar (MIGRACAO.R_D_C) - chaves-pai não localizadas
--DESMTR.TJ.PA.GOV.BR[ALLOWED]>select * from exceptions;
--ROW_ID
----------------------------------------------------------------------------------------------
--OWNER                          TABLE_NAME                     CONSTRAINT
------------------------------ ------------------------------ ------------------------------
--*BAFBCqMCwQP+
--MIGRACAO                       B                              R_B_A
--
--AAAGQ3AAFAAAQqzAAB
-MIGRACAO                       D                              R_D_C
