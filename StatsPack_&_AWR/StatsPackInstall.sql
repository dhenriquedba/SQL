connect sys@PDBP

create public synonym X$KSPPSV for sys.X_$KSPPSV;

@?/rdbms/admin/spcreate 


--connect perfstat/perfstat@pdbp
--@?/rdbms/admin/spctab
--@?/rdbms/admin/spcpkg

-- to purge Snapshots:  @?/rdbms/admin/SPPURGE.SQL 


create tablespace tools
    datafile '/cr9a01/oradata/cr9a/tools01.dbf' size 50m autoextend on next 10m maxsize 2000m
    extent management local;