require 'rspec'
require 'machinist/caching/active_record'

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql",
  :database => "machinist",
  :username => "root",
  :password => ""
)

ActiveRecord::Migration.verbose = false

ActiveRecord::Schema.define(:version => 0) do
  create_table :posts, :force => true do |t|
    t.column :title, :string
    t.column :body,  :text
  end
end

class Post < ActiveRecord::Base
end

Post.blueprint do
  title { 'Lorem ipsum' }
  body  { 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.' }
end

RSpec.configure do |config|
  config.before do
    Machinist::Caching::Shop.instance.reset!
  end
end
