SELECT COUNT(*) extents, SUM (a.BYTES) BYTES, b.x linhas
    FROM DBA_EXTENTS a , (SELECT COUNT(*) x FROM BUSINESS.FO_TRXN_STAGE) b
    WHERE  segment_name= 'FO_TRXN_STAGE'
	group by b.x;
