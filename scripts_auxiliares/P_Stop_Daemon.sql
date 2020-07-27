/*
** Procedure criada para encerrar o processo Daemon
** servidor de sequences
** Alexandre Nobuo Satake - 09.Nov.1999
*/

CREATE OR REPLACE PROCEDURE P_STOP_DAEMON AS
  V_PIPE_NAME VARCHAR2(30);
  V_STATUS    NUMBER;
  V_RETORNO   VARCHAR2(3);
BEGIN
  V_PIPE_NAME := DBMS_PIPE.UNIQUE_SESSION_NAME;
  
  -- Prepara e envia mensagem ao servidor Daemon
  DBMS_PIPE.PACK_MESSAGE ('Stop');
  DBMS_PIPE.PACK_MESSAGE (V_PIPE_NAME);

  -- Envia mensagem com TimeOut de 5 minutos
  V_STATUS := DBMS_PIPE.SEND_MESSAGE ('Daemon', 300);
  IF V_STATUS = 0 THEN

     -- Aguarda Acknowledge por 5 minutos
     V_STATUS := DBMS_PIPE.RECEIVE_MESSAGE (V_PIPE_NAME, 300);

     IF V_STATUS = 0 THEN
        DBMS_PIPE.UNPACK_MESSAGE (V_RETORNO); 
        IF V_RETORNO = 'End' THEN
           DBMS_OUTPUT.PUT_LINE ('Processo Daemon encerrado com êxito.');
        ELSE
           DBMS_OUTPUT.PUT_LINE ('Processo Daemon não pôde ser encerrado.');
        END IF;
     ELSIF V_STATUS = 1 THEN
           DBMS_OUTPUT.PUT_LINE ('Erro de TimeOut no Acknowledge.');
     ELSE
        DBMS_OUTPUT.PUT_LINE ('Erro ao receber Acknowledge de Daemon.');
     END IF;
  ELSE
     DBMS_OUTPUT.PUT_LINE ('Erro ao enviar mensagem ao Daemon.');
  END IF;
END;
/

