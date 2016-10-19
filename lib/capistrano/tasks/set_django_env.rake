namespace :deploy do
  task :set_django_env do
    set :django_env, (fetch(:django_env) || fetch(:stage))
  end

  task :set_python do
    set :python, "#{fetch(:virtual_env_path)}/bin/python"
  end

  task :set_pip do
    set :pip, "#{fetch(:virtual_env_path)}/bin/pip"
  end
end

Capistrano::DSL.stages.each do |stage|
  after stage, "deploy:set_django_env"
  after stage, "deploy:set_python"
  after stage, "deploy:set_pip"
end
