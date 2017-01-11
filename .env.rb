ENV['RACK_ENV'] ||= 'development'

ENV['DATABASE_URL'] ||= case ENV['RACK_ENV']
when 'test'
  "postgres:///roda-sequel-api_test"
when 'production'
  "postgres:///roda-sequel-api_production"
else
  "postgres:///roda-sequel-api_development"
end
