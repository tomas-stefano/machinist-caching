require 'spec_helper'

describe Machinist::Caching::Shop do
  let :shop do
    Machinist::Caching::Shop.instance
  end

  it 'should cache an object' do
    blueprint = Machinist::ActiveRecord::Blueprint.new(Post) {}

    object_a = shop.buy(blueprint)
    object_b = shop.buy(blueprint)

    object_a.should == object_b
  end

  it 'should cache an object with attributes' do
    blueprint = Machinist::ActiveRecord::Blueprint.new(Post) {}

    object_a = shop.buy(blueprint, :title => 'Lorem ipsum')
    object_b = shop.buy(blueprint, :title => 'Lorem ipsum')

    object_a.should == object_b
  end

  it 'should not confuse objects with different blueprints' do
    blueprint_a = Machinist::ActiveRecord::Blueprint.new(Post) {}
    blueprint_b = Machinist::ActiveRecord::Blueprint.new(Post) {}

    object_a = shop.buy(blueprint_a, :title => 'Lorem ipsum')
    object_b = shop.buy(blueprint_b, :title => 'Lorem ipsum')

    object_a.should_not == object_b
  end

  it 'should not confuse objects with same blueprint but different attributes' do
    blueprint = Machinist::ActiveRecord::Blueprint.new(Post) {}

    object_a = shop.buy(blueprint, :title => 'Lorem ipsum')
    object_b = shop.buy(blueprint, :title => 'Lorem ipsum dolor sit amet')

    object_a.should_not == object_b
  end
end
