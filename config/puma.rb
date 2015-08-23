workers Integer(ENV['USER_CONCURRENCY'] || 4)
threads Integer(ENV['MIN_THREADS']  || 1), Integer(16)

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 5000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  # worker specific setup
  ActiveSupport.on_load(:active_record) do
    config = ActiveRecord::Base.configurations[Rails.env] || Rails.application.config.database_configuration[Rails.env]
    config['pool'] = 10
    ActiveRecord::Base.establish_connection(config)
  end
end
