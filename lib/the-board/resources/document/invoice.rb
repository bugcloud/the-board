module TheBoard
  module Document
    class Invoice
      RESOURCE_COLLECTION = "/documents/invoices"

      def self.load(id, params = {})
        client = ApiClient.new("#{self::RESOURCE_COLLECTION}/#{id}", :get, params)
        client.request
      end

      def self.update(id, params = {})
        client = ApiClient.new("#{self::RESOURCE_COLLECTION}/#{id}", :put, params)
        client.request
      end
    end
  end
end
