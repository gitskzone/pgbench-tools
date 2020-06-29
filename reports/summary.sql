SELECT
  set,script,scale,
  pg_size_pretty(avg(dbsize)::int8) AS db_size,
  clients,
  rate_limit,
  round(avg(tps)) as tps,
  round(1000 * avg(avg_latency))/1000 AS avg_latency,
  round(1000 * avg(max_latency))/1000 AS max_latency
--  round(1000 * avg(percentile_90_latency))/1000 AS "90%<"
--  to_char(avg(end_time -  start_time),'HH24:MI:SS') AS runtime
FROM tests 
GROUP BY set,script,scale,clients,rate_limit 
ORDER BY set,script,scale,clients,rate_limit; 
