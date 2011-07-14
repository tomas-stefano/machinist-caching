require 'spec_helper'

describe Machinist::Caching::ActiveRecord::Blueprint do
  let :blueprint do
    Machinist::ActiveRecord::Blueprint.new(Post) {}
  end

  let :post do
    Post.make!
  end

  it 'should box object using id' do
    blueprint.box(post).should == post.id
  end

  it 'should unbox object using id' do
    blueprint.unbox(post.id).should == post
  end
end
