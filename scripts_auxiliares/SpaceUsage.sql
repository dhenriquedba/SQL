Declare
	varUNFORMATTED_BLOCKS	number;
	varUNFORMATTED_BYTES	number;
	varFS1_BLOCKS	number;
	varFS1_BYTES	number;
	varFS2_BLOCKS	number;
	varFS2_BYTES	number;
	varFS3_BLOCKS	number;
	varFS3_BYTES	number;
	varFS4_BLOCKS	number;
	varFS4_BYTES	number;
	varFULL_BLOCKS	number;
	varFULL_BYTES	number;
Begin
 dbms_space.SPACE_USAGE(  upper('&SEGMENT_OWNER')
				 ,upper('&SEGMENT_NAME')
				 ,upper('&SEGMENT_TYPE')
				 ,varUNFORMATTED_BLOCKS
				 ,varUNFORMATTED_BYTES
				 ,varFS1_BLOCKS
				 ,varFS1_BYTES
				 ,varFS2_BLOCKS
				 ,varFS2_BYTES
				 ,varFS3_BLOCKS
				 ,varFS3_BYTES
				 ,varFS4_BLOCKS
				 ,varFS4_BYTES
				 ,varFULL_BLOCKS
				 ,varFULL_BYTES
				 ,upper('&PARTITION_NAME'));
Dbms_output.put_line('UNFORMATTED_BLOCKS: '||varUNFORMATTED_BLOCKS);
Dbms_output.put_line('UNFORMATTED_BYTES: '||varUNFORMATTED_BYTES); 
Dbms_output.put_line('FS1_BLOCKS: '||varFS1_BLOCKS);
Dbms_output.put_line('FS1_BYTES: '||varFS1_BYTES); 
Dbms_output.put_line('FS2_BLOCKS: '||varFS2_BLOCKS);
Dbms_output.put_line('FS2_BYTES: '||varFS2_BYTES); 
Dbms_output.put_line('FS3_BLOCKS: '||varFS3_BLOCKS);
Dbms_output.put_line('FS3_BYTES: '||varFS3_BYTES);
Dbms_output.put_line('FS4_BLOCKS: '||varFS4_BLOCKS);
Dbms_output.put_line('FS4_BYTES: '||varFS4_BYTES);
Dbms_output.put_line('FULL_BLOCKS: '||varFULL_BLOCKS);
Dbms_output.put_line('FULL_BYTES: '||varFULL_BYTES);
end;
/
prompt
prompt  Ed SpaceUsage			@ SpaceUsage
prompt

