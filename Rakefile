PROJ_ROOT = __dir__

Dir["#{PROJ_ROOT}/lib/tasks/**/*.rake"].each do |path|
  load path
end

desc "give the application an appropriate name"
task :setup, [:name] do |t, args|
  unless name = args[:name]
    $stderr.puts "ERROR: Must provide a name argument: example: rake setup[AppName]"
    exit(1)
  end

  require 'securerandom'
  File.write('.session_secret', SecureRandom.random_bytes(40))

  lower_name = name.gsub(/([a-z\d])([A-Z])/, '\1_\2').downcase
  File.write('.env.rb', <<END)
ENV['RACK_ENV'] ||= 'development'

ENV['DATABASE_URL'] ||= case ENV['RACK_ENV']
when 'test'
  "postgres:///#{lower_name}_test"
when 'production'
  "postgres:///#{lower_name}_production"
else
  "postgres:///#{lower_name}_development"
end
END
end
