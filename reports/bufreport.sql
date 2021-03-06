select 
  tests.server,set,script,scale,tests.test,clients,round(tps) as tps,
  checkpoints_timed+checkpoints_req as chkpts,
  buffers_checkpoint as buf_check,
  buffers_clean as buf_clean,
  buffers_backend as buf_backend,
  buffers_alloc as buf_alloc,
  buffers_backend_fsync as backend_sync,
  max_dirty
from test_bgwriter right join tests on tests.server=test_bgwriter.server AND tests.test=test_bgwriter.test
order by server,script,set,scale,clients,test;
