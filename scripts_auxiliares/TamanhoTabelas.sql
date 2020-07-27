select table_name, SUM(nvl(DATA_LENGTH,0) + nvl(DATA_PRECISION,0)) "Estimativa Tamanho Máximo"
 from dba_tab_columns
where owner='ADMSVC'
   and table_name in('ROOTCAUSEA1',
				'ROOTCAUSEA10',
				'ROOTCAUSEA11',
				'ROOTCAUSEA12',
				'ROOTCAUSEA13',
				'ROOTCAUSEA2',
				'ROOTCAUSEA3',
				'ROOTCAUSEA4',
				'ROOTCAUSEA5',
				'ROOTCAUSEA6',
				'ROOTCAUSEA7',
				'ROOTCAUSEA8',
				'ROOTCAUSEA9',
				'ROOTCAUSEM1')
group by table_name
/
