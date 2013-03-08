require 'pg'
require 'rspec'
require 'line'
require 'station'
require 'stop'

DB = PG.connect(:dbname => 'trains_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM line *;")
    DB.exec("DELETE FROM station *;")
    DB.exec("DELETE FROM stop *;")

  end
end