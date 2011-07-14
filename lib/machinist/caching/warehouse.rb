module Machinist
  module Caching
    # A Warehouse is a hash supports lists as keys.
    #
    # It's used for storing cached objects created by Machinist::Caching::Shop.
    #
    #     warehouse[klass, attributes] = object
    #     warehouse[klass, attributes] # => object
    class Warehouse
      attr_accessor :shelf

      def initialize #:nodoc:
        self.shelf = Hash.new{|hash, key| hash[key] = {}}
      end

      # Assign a value for the given list of keys.
      def []=(klass, attributes, object)
        shelf[klass][attributes] = object
      end

      # Return the value for the given list of keys.
      def [](klass, attributes)
        shelf[klass][attributes]
      end
    end
  end
end
