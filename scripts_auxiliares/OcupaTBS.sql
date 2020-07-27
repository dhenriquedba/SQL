Select t.tablespace_name, sum(f.bytes) free, sum(decode(t.maxbytes,0,t.bytes,t.maxbytes)) total,
           (sum(f.bytes)/sum(decode(t.maxbytes,0,t.bytes,t.maxbytes))*100) "%free"
      from dba_data_files t, dba_free_space f
           where t.tablespace_name = f.tablespace_name
             and t.tablespace_name  in (select tablespace_name
                                          from dba_segments
                                            where segment_name in
                                                  ('CASH_TRXN', 'MI_TRXN', 'WIRE_TRXN', 'BUS_DATA'))
      group by  t.tablespace_name
/




Select t.tablespace_name, sum(u.bytes) used, sum(decode(t.maxbytes,0,t.bytes,t.maxbytes)) total,
           (sum(u.bytes)/sum(decode(t.maxbytes,0,t.bytes,t.maxbytes))*100) "%free"
      from dba_data_files t, dba_extents u
           where t.tablespace_name = u.tablespace_name
             and t.tablespace_name  in (select tablespace_name
                                          from dba_segments
                                            where segment_name in
                                                  ('CASH_TRXN', 'MI_TRXN', 'WIRE_TRXN', 'BUS_DATA'))
      group by  t.tablespace_name
/

