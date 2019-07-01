module Links
  module Operations
    class List
      attr_reader :repo, :key_generator

      def initialize(repo: LinkRepository.new)
        @repo = repo
      end

      def call(_payload = {})
        repo.all
      end
    end
  end
end
