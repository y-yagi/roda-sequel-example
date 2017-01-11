migrate = -> (env, version) do
  ENV['RACK_ENV'] = env
  require_relative "#{PROJ_ROOT}/db"
  require 'logger'
  Sequel.extension :migration
  DB.loggers << Logger.new($stdout)
  Sequel::Migrator.apply(DB, "#{PROJ_ROOT}/migrate", version)
end

namespace :db do
  desc "Migrate database to latest version"
  task :migrate do
    env = ENV['RACK_ENV'] || 'development'
    migrate.call(env, nil)
  end

  desc "Migrate database all the way down"
  task :rollback do
    env = ENV['RACK_ENV'] || 'development'
    migrate.call(env, 0)
  end
end
