begin dbms_session.set_nls('NLS_DATE_FORMAT','''dd-mon-yyyy'''); 
	  dbms_output.put_line('Formato de data determinado: '||sysdate);
	  end;
/
--
begin dbms_session.set_nls('NLS_DATE_FORMAT','''dd-mm-yy'''); 
	  dbms_output.put_line('Formato de data determinado: '||sysdate);
	  end;
/