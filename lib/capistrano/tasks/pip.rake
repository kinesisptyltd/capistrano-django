load File.expand_path("../set_django_env.rake", __FILE__)

namespace :pip do
  desc "Runs pip install"
  task :install do
    on fetch(:pip_roles) do
      within release_path do
        execute fetch(:pip), :install, "-r", "requirements.txt"
      end
    end
  end
end

namespace :load do
  task :defaults do
    set :pip_roles, fetch(:all)
  end
end

before "deploy:updated", "pip:install"
before "deploy:reverted", "pip:install"
