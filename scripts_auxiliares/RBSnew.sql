ALTER TABLESPACE RBS
	DEFAULT STORAGE 
		( INITIAL 512K NEXT 512K MINEXTENTS 8 PCTINCREASE 0 )
/
ALTER TABLESPACE RBS 
	MINIMUM EXTENT 512K
/
create rollback segment RBS0 tablespace rbs storage (maxextents unlimited);
create rollback segment RBS1 tablespace rbs storage (maxextents unlimited);
create rollback segment RBS2 tablespace rbs storage (maxextents unlimited);
create rollback segment RBS3 tablespace rbs storage (maxextents unlimited);
create rollback segment RBS4 tablespace rbs storage (maxextents unlimited);
create rollback segment RBS5 tablespace rbs storage (maxextents unlimited);
create rollback segment RBS6 tablespace rbs storage (maxextents unlimited);
create rollback segment RBS7 tablespace rbs storage (maxextents unlimited);
create rollback segment RBS8 tablespace rbs storage (maxextents unlimited);
create rollback segment RBS9 tablespace rbs storage (maxextents unlimited);

alter rollback segment RBS0 online;
alter rollback segment RBS1 online;
alter rollback segment RBS2 online;
alter rollback segment RBS3 online;
alter rollback segment RBS4 online;
alter rollback segment RBS5 online;
alter rollback segment RBS6 online;
alter rollback segment RBS7 online;
alter rollback segment RBS8 online;
alter rollback segment RBS9 online;

alter rollback segment lixo offline;
drop rollback segment lixo;
alter rollback segment lixo1 offline;
drop rollback segment lixo1;

prompt
prompt  Init<SID>.ora:
prompt  rollback_segments = (RBS0, RBS1, RBS2, RBS3, RBS4, RBS5, RBS6, RBS7, RBS8, RBS9) # ajuste 15mar2004. Odecio
prompt  Ed RBSnew      @ RBSnew      @ RBSdrop
prompt

