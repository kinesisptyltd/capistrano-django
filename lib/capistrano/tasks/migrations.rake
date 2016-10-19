load File.expand_path("../set_django_env.rake", __FILE__)

namespace :deploy do
  desc "Runs migrations"
  task migrate: [:set_django_env] do
    on fetch(:migration_servers) do
      within release_path do
        with django_env: fetch(:django_env) do
          execute fetch(:python), "manage.py", :migrate
        end
      end
    end
  end

  after "deploy:updated", "deploy:migrate"
end

namespace :load do
  task :defaults do
    set :migration_role, fetch(:migration_role, :db)
    set :migration_servers, -> { primary(fetch(:migration_role)) }
  end
end
