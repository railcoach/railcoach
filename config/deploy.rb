set :application, "ProjectLodge"
set :repository,  "git@beta.projectlodge.org:projectlodge-beta.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "beta.projectlodge.org"                          # Your HTTP server, Apache/etc
role :app, "beta.projectlodge.org"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"
#role :beta, "beta.projectlodge.org" 

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

desc "Deploy script for beta server"
task :deploy_beta do
  run "bundle install"
  run "rake db:create:all"
  run "rake db:migrate"
  run "ls -al"
end

