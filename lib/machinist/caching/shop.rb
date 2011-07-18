require 'singleton'

module Machinist
  module Caching
    # The shop takes care of caching database objects.
    #
    # Calling make! on a class requests objects from the shop; you don't
    # normally access the shop directly.
    #
    # Read more about object caching on the
    # wiki[http://wiki.github.com/notahat/machinist/object-caching].
    class Shop
      include Singleton

      attr_accessor :warehouse

      def initialize #:nodoc:
        reset!
      end

      # Throw out the entire collection of cached objects.
      def reset!
        self.warehouse = Warehouse.new
      end

      # Buy a (possibly cached) object from the shop.
      #
      # This is just like constructing an object by calling Blueprint#make!,
      # but it will return a previously cached object if one is available.
      def buy(blueprint, attributes = {})
        raise BlueprintCantSaveError.new(blueprint) unless blueprint.respond_to?(:make!)

        cached = warehouse[blueprint, attributes]

        if cached.nil?
          blueprint.make!(attributes).tap do |object|
            warehouse[blueprint, attributes] = blueprint.box(object)
          end
        else
          blueprint.unbox(cached)
        end
      end
    end
  end
end
