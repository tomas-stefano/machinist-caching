require 'spec_helper'

describe Machinist::Caching::Warehouse do
  let :warehouse do
    Machinist::Caching::Warehouse.new
  end

  it 'should return nil for a new key' do
    warehouse['klass', 'attributes'].should == nil
  end

  it 'should store and retrieve values' do
    warehouse['klass', 'attributes'] = 'object'
    warehouse['klass', 'attributes'].should == 'object'
  end
end
