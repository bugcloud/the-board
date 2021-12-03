module TheBoard
  module Resource
    def self.included(klass)
      klass.extend ClassMethods
    end

    module ClassMethods
      def all(params = {})
        client = ApiClient.new(self::RESOURCE_COLLECTION, :get, params)
        client.request
      end

      def create(params = {})
        client = ApiClient.new(self::RESOURCE_COLLECTION, :post, params)
        client.request
      end

      def update(id, params = {})
        client = ApiClient.new("#{self::RESOURCE_COLLECTION}/#{id}", :put, params)
        client.request
      end

      def destroy(id)
        client = ApiClient.new("#{self::RESOURCE_COLLECTION}/#{id}", :delete)
        client.request
      end
    end
  end
end
