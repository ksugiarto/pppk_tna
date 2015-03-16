cd pppk_tna
kill $(cat tmp/pids/server.pid)
RAILS_ENV=production rails s &