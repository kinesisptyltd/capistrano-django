load File.expand_path("../set_django_env.rake", __FILE__)

namespace :pip do
  desc "Runs pip install"
  task :install do
    on roles(:all) do
      within release_path do
        execute fetch(:pip), :install, "-r", "requirements.txt", "--exists-action", "wipe"
      end
    end
  end
end

before "deploy:updated", "pip:install"
before "deploy:reverted", "pip:install"
