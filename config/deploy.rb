set :bundle_cmd, '/home/dietbook/gems/bin/bundle'
require 'bundler/capistrano'

server "ssh.alwaysdata.com", :web, :app, :db, primary: true

set :user, "dietbook_emilien"
set :application_folder, "dietbook"
set :git_repository, "dietbook"
set :deploy_to, "#{application_folder}"
set :rails_env, "production"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:emilienc/newsana.git"
set :branch, "master"


default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :keep_releases, 1
set :git_enable_submodules, 1

after "deploy", "deploy:cleanup"
after "deploy:migrations", "deploy:cleanup"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end