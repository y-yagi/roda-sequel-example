irb = proc do |env|
  ENV['RACK_ENV'] = env
  trap('INT', "IGNORE")
  sh "#{FileUtils::RUBY.sub('ruby', 'irb')} -r #{PROJ_ROOT}/models"
end

desc "Open irb shell"
task :test_irb do
  env = ENV['RACK_ENV'] || 'development'
  irb.call(env)
end
