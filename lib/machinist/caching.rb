require 'machinist'

module Machinist
  module Caching
    autoload :Machinable, 'machinist/caching/machinable'
    autoload :Shop, 'machinist/caching/shop'
    autoload :Warehouse, 'machinist/caching/warehouse'
  end

  module Machinable #:nodoc:
    include Machinist::Caching::Machinable
  end

  # Call this before each test to get Machinist ready.
  def self.reset_before_test
    Machinist::Caching::Shop.instance.restock
  end
end
