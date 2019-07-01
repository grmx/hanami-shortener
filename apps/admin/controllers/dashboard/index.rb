module Admin
  module Controllers
    module Dashboard
      class Index
        include Admin::Action

        attr_reader :operation

        expose :links

        def initialize(operation: Links::Operations::List.new)
          @operation = operation
        end

        def call(params)
          @links = operation.call
        end
      end
    end
  end
end
