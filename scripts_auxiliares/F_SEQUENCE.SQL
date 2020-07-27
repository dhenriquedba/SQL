/* 
** Função criada para recuperar o próximo valor
** de sequences de T_CONTROLE_SEQUENCE
** Implementado através de DBMS_PIPE para solucionar
** problemas de LOCK
** O processo servidor utiliza o pipe 'Daemon'
** Alexandre Nobuo Satake - 09.Nov.1999
*/

Create or Replace function F_Sequence
	(P_UNIDADE	T_Controle_Sequence.Cd_unidade%Type,
	 P_TABELA	T_Controle_Sequence.Nm_tabela%Type,
	 P_SEQUENCE	T_Controle_Sequence.Nm_sequence%Type)
		RETURN number
as
      V_NUMERO	  T_Controle_Sequence.Nr_ultimo_usado%Type;
      V_PIPE_NAME VARCHAR2(30);
      V_STATUS    NUMBER;
      V_MSG_ERRO  VARCHAR2(100);
      V_CHECK     VARCHAR2(5);
Begin
  -- Prepara um Pipe para ser o canal de resposta
  V_PIPE_NAME := DBMS_PIPE.UNIQUE_SESSION_NAME;

  -- Prepara o pacote a ser enviado
  DBMS_PIPE.PACK_MESSAGE (USER);
  DBMS_PIPE.PACK_MESSAGE (P_UNIDADE);
  DBMS_PIPE.PACK_MESSAGE (P_TABELA);
  DBMS_PIPE.PACK_MESSAGE (P_SEQUENCE);
  DBMS_PIPE.PACK_MESSAGE (V_PIPE_NAME);

  -- Envia ao Daemon, com TimeOut de 2 minutos
  V_STATUS := DBMS_PIPE.SEND_MESSAGE ('Daemon', 120);
  
  IF V_STATUS <> 0 THEN
     RAISE_APPLICATION_ERROR (-20001, 'Erro em F_SEQUENCE ao enviar pacote ao Daemon.');
  END IF;

  -- Aguarda resposta com TimeOut de 5 minutos
  V_STATUS := DBMS_PIPE.RECEIVE_MESSAGE (V_PIPE_NAME, 300);  

  IF V_STATUS = 0 THEN 
     DBMS_PIPE.UNPACK_MESSAGE (V_CHECK);
     DBMS_PIPE.UNPACK_MESSAGE (V_NUMERO);
     DBMS_PIPE.UNPACK_MESSAGE (V_MSG_ERRO);

     IF V_CHECK = 'Done' THEN
        K_SEQ.CurrVal := V_NUMERO;
        Return (K_SEQ.CurrVal);
     ELSE
        IF V_NUMERO = -54 THEN         /* Erro de Lock */
           RAISE_APPLICATION_ERROR (-20002, 'Erro em F_SEQUENCE ao tentar reservar um registro já reservado.');
        ELSIF V_NUMERO = 100 THEN    /* No Data Found */
           RAISE_APPLICATION_ERROR (-20010, 'Dado não localizado por F_SEQUENCE.');
        ELSE
           RAISE_APPLICATION_ERROR (-20020, TO_CHAR(V_NUMERO) || ' F_SEQUENCE => ' || V_MSG_ERRO);
        END IF;
     END IF;
  ELSIF V_STATUS = 1 THEN 
        -- Erro de TimeOut
        RAISE_APPLICATION_ERROR (-20030, 'TimeOut em F_SEQUENCE na espera da resposta do Daemon.');
  ELSE
        RAISE_APPLICATION_ERROR (-20040, 'Erro na resposta do Daemon para F_SEQUENCE.');
  END IF;

End;
/

