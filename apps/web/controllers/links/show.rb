module Web
  module Controllers
    module Links
      class Show
        include Web::Action

        attr_reader :operation

        def initialize(operation: ::Links::Operations::Show.new)
          @operation = operation
        end

        def call(params)
          if link = operation.call(key: params[:id])
            redirect_to link.url
          else
            self.status = 404
            self.body = 'Not Found'
          end
        end
      end
    end
  end
end
