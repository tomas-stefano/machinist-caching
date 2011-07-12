module Machinist
  module Caching
    module Machinable
      # Construct and save an object from a blueprint, if the class allows saving.
      #
      # :call-seq:
      #   make!([count], [blueprint_name], [attributes = {}])
      #
      # A cached object will be returned from the shop if possible. See
      # Machinist::Caching::Shop.
      #
      # Arguments are the same as for make.
      def make!(*args)
        decode_args_to_make(*args) do |blueprint, attributes|
          Shop.instance.buy(blueprint, attributes)
        end
      end
    end
  end
end
