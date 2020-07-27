select count(*) from interface_legado_log_param
     where illp_seq in (select illo_seq
			from interface_legado_log
				where illo_dt_inicio >= sysdate-30
                		  and ( illo_id_pedido is null or
                      			not exists ( select 1
                                   		from pedido_de_venda_cabecalho
                                  		where pedc_id_pedido = illo_id_pedido
                                    		and pedc_situacao    = 'A')));


14:24:16 @prd70[ALLOWED=LC000780]>select count(*) from interface_legado_log_param
14:24:19   2       where illp_seq in (select illo_seq
14:24:19   3     from interface_legado_log
14:24:19   4      where illo_dt_inicio >= sysdate-30
14:24:19   5                      and ( illo_id_pedido is null or
14:24:19   6                           not exists ( select 1
14:24:19   7                                       from pedido_de_venda_cabecalho
14:24:19   8                                      where pedc_id_pedido = illo_id_pedido
14:24:19   9                                        and pedc_situacao    = 'A')));

  COUNT(*)
----------
 134.645.488
