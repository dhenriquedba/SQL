select count(*), to_char(CLNDR_DT,'YYYY/MM') data from mantas.kdd_cal a where BUS_DAY_FL = 'Y' 	group by to_char(CLNDR_DT,'YYYY/MM')      order by data;
/*
       22 2005/03  15578 =>  709
       20 2005/04  21042 => 1052
       21 2005/05  24065 => 1146
       22 2005/06  25829 => 1174


select count(*) from business.wire_trxn partition(P200506) -- particao
       where SRC_SYS_CD = 'SWN';


*/