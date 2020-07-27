Select name, value from v$parameter where name in (
'shared_pool_size', 'sga_max_size', 'shared_pool_reserved_size',
'large_pool_size', 'java_pool_size', 'pre_page_sga', 'db_cache_size',
'log_buffer', 'fast_start_mttr_target', 'cursor_space_for_time',
'cursor_sharing', 'parallel_max_servers', 'parallel_execution_message_size',
'open_cursors', 'parallel_automatic_tuning', 'optimizer_max_permutations',
'optimizer_index_cost_adj', 'query_rewrite_enabled', 'query_rewrite_integrity',
'pga_aggregate_target', 'statistics_level')
/
