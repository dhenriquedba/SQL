alter table PSAPDISTRIBUICAOHISTORICO
drop   constraint r_568
/


alter table PSAPDISTRIBUICAOHISTORICO
add   constraint r_568 foreign key
(CDCOMARCA, CDPROCESSO)  references PSAPPROCESSO
deferrable
/


