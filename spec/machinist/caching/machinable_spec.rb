require 'spec_helper'

describe Machinist::Caching::Machinable do
  it 'should buy objects from the shop' do
    post_a = Post.make!
    post_b = Post.make!

    post_a.should == post_b
  end
end
