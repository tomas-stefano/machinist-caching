require 'machinist/caching'
require 'machinist/active_record'

module Machinist #:nodoc:
  module ActiveRecord
    class Blueprint
      include Machinist::Caching::ActiveRecord::Blueprint
    end
  end
end

module ActiveRecord #:nodoc:
  class Base
    extend Machinist::Caching::Machinable
  end
end
