require_relative 'models'
require 'roda'

class App < Roda
  plugin :json, classes: [Array, Hash, Sequel::Model]

  route do |r|
    r.root do
      r.redirect "/users"
    end

    r.on "users" do
      r.is do
        r.get do
          User.all
        end
      end
    end
  end
end
