declare
	cursor CurObj is
		select upper(object_name) object_name, owner
			from dba_objects
				Where owner in ('SAPXXI', 'ARR')
				  And object_type not like '%JAVA%'
				  And object_type in ('TABLE', 'INDEX');

	cursor CurExt is
		select upper(segment_name) segment_name, owner, count(*) tot, sum(bytes) extbytes
			from dba_extents
				Where owner in ('SAPXXI', 'ARR')
				  And segment_type not like '%JAVA%'
				group by segment_name, owner;
	cursor CurTab is
		select upper(table_name) table_name, owner, nvl(NUM_ROWS*AVG_ROW_LEN,0) TabBytes
			from dba_tables
				Where owner in ('SAPXXI', 'ARR');
	cursor CurInd is
		select upper(index_name) index_name, table_owner, nvl(NUM_ROWS*SAMPLE_SIZE,0) TabBytes
			from dba_indexes
				Where table_owner in ('SAPXXI', 'ARR');
	ContErro number :=0;
Begin
	For h in CurObj loop
		begin
			Insert into sys.EstrutEspaco (objeto, owner, analise)
				values (h.object_name, h.owner, trunc(sysdate));
		exception
			when dup_val_on_index then
				ContErro := ContErro +1;
		end;
	end loop;		
	Dbms_output.put_line('Erros. Insert de objeto: '||ContErro);
	ContErro := 0;
	For i in CurExt loop
	 	Update sys.EstrutEspaco set
			SEGMENTO	=	i.segment_name,
			EXTENTS		=	i.tot,
			BYTESEXTENTS	=	i.extbytes
		Where   OBJETO		=	i.segment_name
		  and	OWNER		=	i.owner
		  and   ANALISE		=	trunc(sysdate);
		if sql%notfound then
			Insert into sys.EstrutEspaco (objeto, owner, 
							analise, extents, bytesextents)
				values (i.segment_name, i.owner,
					trunc(sysdate), i.tot, i.extbytes);
			ContErro := ContErro +1;
		end if;
	end loop;
	Dbms_output.put_line('Erros. Insert de segmento: '||ContErro);
	ContErro := 0;
	For j in CurTab loop
	 	Update sys.EstrutEspaco set
			BYTESLINHAS	=	j.TabBytes
		Where   OBJETO		=	j.table_name
		  and	OWNER		=	j.owner
		  and   ANALISE		=	trunc(sysdate);
		if sql%notfound then
			Insert into sys.EstrutEspaco (objeto, owner, 
							analise, byteslinhas)
				values (j.table_name, j.owner,
					trunc(sysdate), j.TabBytes);
			ContErro := ContErro +1;
		end if;
	end loop;
	Dbms_output.put_line('Erros. Insert de tabela: '||ContErro);
	ContErro := 0;

/* conceito de volume errado !!!
	For k in CurInd loop
	 	Update sys.EstrutEspaco set
			BYTESLINHAS	=	k.TabBytes
		Where   OBJETO		=	k.index_name
		  and	OWNER		=	k.table_owner
		  and   ANALISE		=	trunc(sysdate);
		if sql%notfound then
			Insert into sys.EstrutEspaco (objeto, owner, 
							analise, byteslinhas)
				values (k.index_name, k.table_owner,
					trunc(sysdate), k.TabBytes);
			ContErro := ContErro +1;
		end if;
	end loop;
	Dbms_output.put_line('Erros. Insert de index: '||ContErro);
*/
end;
/
--rollback;

set lines 200
column owner format a6
column BYTESEXTENTS format 9,999,999,999
column BYTESLINHAS format  9,999,999,999,999
spool EstrutEspaco.doc
select  OWNER, OBJETO, SEGMENTO, EXTENTS, BYTESEXTENTS, BYTESLINHAS
	from estrutespaco
	order by 1,2
/
spool off
                     