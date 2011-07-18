module Machinist
  module Caching
    module ActiveRecord
      module Blueprint
        # Box an object for storage in the warehouse.
        def box(object)
          object.id
        end

        # Unbox an object from the warehouse.
        def unbox(id)
          @klass.find(id)
        end
      end
    end
  end
end
