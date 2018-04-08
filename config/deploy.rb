# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"

set :application, "talent_fore"
set :repo_url, "git@github.com:SalesWorldIn/talent_fore.git"
set :branch, 'staged' || ENV['BRANCH']
set :deploy_to, '/var/www/talent_fore'

set :log_level, :debug
set :pty, true
set :format, :pretty

set :migration_role, :app
set :migration_servers, -> { primary(fetch(:migration_role)) }

set :unicorn_rack_env, :production
set :unicorn_conf, "#{current_path}/config/unicorn.rb"
set :unicorn_pid, "#{shared_path}/tmp/pids/unicorn.pid"

set :ssh_options, {
  keys: %w(~/Documents/salesworld/talentfore/talent_fore_key_march_25_2018.pem),
  forward_agent: false
}

set :keep_releases, 3
set :keep_assets, 1

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'
append :linked_files, 'config/database.yml', 'config/secrets.yml'

namespace :deploy do

  task :restart do
    invoke 'unicorn:stop'
    invoke 'unicorn:reload'
  end

  task :stop do
    invoke 'unicorn:stop'
  end

  task :start do
    invoke 'unicorn:reload'
  end
end

after "deploy", "deploy:cleanup"
after 'deploy:publishing', 'deploy:restart'
after "deploy:update_code", "deploy:migrate"
after "deploy:migrate", "deploy:seed"
