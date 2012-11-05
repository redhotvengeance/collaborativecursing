namespace :pg do
  desc "Start Postgres"
  task :start do
    sh %{pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start}, :verbose => true
  end

  desc "Stop Postgres"
  task :stop do
    sh %{pg_ctl -D /usr/local/var/postgres stop -s -m fast}, :verbose => true
  end
end
