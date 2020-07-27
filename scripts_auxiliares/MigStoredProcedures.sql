column object_type format a30
column owner       format a30

select owner, object_type, count(*)
from dba_objects
where object_type in ('FUNCTION','DATABASE LINK','PACKAGE','PACKAGE BODY','PROCEDURE','SYNONYM','VIEW')
  and owner in ('EDIF_DES_LND','SG_ELE_EDIF')
group by owner, object_type
/


/*

  1  select owner, object_type, count(*)
  2  from dba_objects
  3  where object_type in ('FUNCTION','DATABASE LINK','PACKAGE','PACKAGE BODY','PROCEDURE','SYNONYM','VIEW')
  4    and owner in ('EDIF_DES_LND','SG_ELE_EDIF')
  5* group by owner, object_type

OWNER                          OBJECT_TYPE                      COUNT(*)
------------------------------ ------------------------------ ----------
EDIF_DES_LND                   PACKAGE                                11
EDIF_DES_LND                   PACKAGE BODY                            7
EDIF_DES_LND                   SYNONYM                                33
SG_ELE_EDIF                    FUNCTION                                3
SG_ELE_EDIF                    PACKAGE                                23
SG_ELE_EDIF                    PACKAGE BODY                           18
SG_ELE_EDIF                    SYNONYM                                33
SG_ELE_EDIF                    VIEW                                   16

*/