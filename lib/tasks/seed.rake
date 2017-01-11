require_relative "#{PROJ_ROOT}/models"

desc "Loads the seed data"
task :seed do
  now = Time.now
  user_data = 100.times.map do |i|
    { name: "dummy_#{i}", email: "dummy_#{i}@example.com", created_at: now, updated_at: now }
  end
  User.multi_insert(user_data)
end
