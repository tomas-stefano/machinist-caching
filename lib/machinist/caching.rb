require 'machinist'

module Machinist
  module Caching
    autoload :Machinable, 'machinist/caching/machinable'
    autoload :Shop,       'machinist/caching/shop'
    autoload :Warehouse,  'machinist/caching/warehouse'

    module ActiveRecord
      autoload :Blueprint, 'machinist/caching/active_record/blueprint'
    end
  end

  module Machinable #:nodoc:
    extend Machinist::Caching::Machinable
  end
end
