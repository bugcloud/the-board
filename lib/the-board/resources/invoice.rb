module TheBoard
  class Invoice
    RESOURCE_COLLECTION = "/invoices"

    def self.all(params = {})
      client = ApiClient.new(self::RESOURCE_COLLECTION, :get, params)
      client.request
    end
  end
end
