module TheBoard
  class Error < StandardError
  end

  # Server Errors (5XX)
  class ServerError < Error; end

  # Client Errors (4XX)
  class ClientError < Error; end
end
