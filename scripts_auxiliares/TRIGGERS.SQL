SPOOL TRIGGERS__1.log
SET ECHO ON

CREATE OR REPLACE TRIGGER PSAPVARADESPACHOPADRAOLOG_BIR
BEFORE INSERT ON PSAPVARADESPPADRAOLOG
FOR EACH ROW
begin
  if DBMS_REPUTIL.FROM_REMOTE or DBMS_SNAPSHOT.I_AM_A_REFRESH then
    return;
  end if;
  :new.DtInclusao := SYSDATE;
  :new.CdUsuario  := USER;
end;
/
CREATE OR REPLACE TRIGGER PSAPVARADESPACHOPADRAOLOG_BU
BEFORE UPDATE ON PSAPVARADESPPADRAOLOG
FOR STATEMENT
begin
  raise_application_error(-20005, 'Não são permitidas alterações de registros nessa tabela.');
end;
/
CREATE OR REPLACE TRIGGER PSAPVARADESPPADRAO_AIUR
AFTER INSERT OR UPDATE ON PSAPVARADESPPADRAO
FOR EACH ROW
begin
  if DBMS_REPUTIL.FROM_REMOTE or DBMS_SNAPSHOT.I_AM_A_REFRESH then
    return;
  end if;
  insert into PSAPVaraDespPadraoLog
         (CdComarca,
          CdVara,
          CdTpMvProcesso,
          CdDespachoPadrao,
          DeDespachoPadrao,
          TxtDespachoPadrao,
          FlExcluido)
         values (:new.CdComarca,
                 :new.CdVara,
                 :new.CdTpMvProcesso,
                 :new.CdDespachoPadrao,
                 :new.DeDespachoPadrao,
                 :new.TxtDespachoPadrao,
                 :new.FlExcluido);
end;
/
CREATE OR REPLACE TRIGGER PSAPVARADESPPADRAO_BIR
BEFORE INSERT ON PSAPVARADESPPADRAO
FOR EACH ROW
begin
  if :new.CdDespachoPadrao is null then
    select nvl(max(CdDespachoPadrao),0) + 1
           into :new.CdDespachoPadrao
           from PSAPVaraDespPadrao
           where CdComarca      = :new.CdComarca      and
                 CdVara         = :new.CdVara         and
                 CdTpMvProcesso = :new.CdTpMvProcesso;
  end if;
end;
/

SET ECHO OFF
SPOOL OFF
