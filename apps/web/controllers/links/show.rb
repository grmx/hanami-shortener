module Web
  module Controllers
    module Links
      class Show
        include Web::Action

        attr_reader :repo

        def initialize(repo: LinkRepository.new)
          @repo = repo
        end

        def call(params)
          if link = repo.find_by_key(params[:id])
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
