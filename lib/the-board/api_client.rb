require "net/http"
require "json"

module TheBoard
  class ApiClient
    API_BASE_URL = "https://api.the-board.jp/v1"

    def initialize(path, method, params = {})
      @path = path
      @method = method
      @params = params
    end

    def request
      send("request_#{@method}".to_sym)
    end

    private

    def request_get
      request_with_query(Net::HTTP::Get)
    end

    def request_post
      request_with_body(Net::HTTP::Post)
    end

    def request_put
      request_with_body(Net::HTTP::Put)
    end

    def request_delete
      request_with_query(Net::HTTP::Delete)
    end

    def request_with_query(request_class)
      uri = URI.parse("#{API_BASE_URL}#{@path}")
      uri.query = URI.encode_www_form(@params) if @params
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      req = request_class.new(uri)
      req.initialize_http_header(request_headers)
      res = http.request(req)
      body = res.body ? JSON.parse(res.body, symbolize_names: true) : res.body
      unless res.is_a?(Net::HTTPSuccess)
        # TODO: handling errors
        error_class = res.is_a?(Net::HTTPClientError) ? TheBoard::ClientError : TheBoard::ServerError
        raise error_class.new(body.dig(:message))
      end
      body
    end

    def request_with_body(request_class)
      uri = URI.parse("#{API_BASE_URL}#{@path}")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      req = request_class.new(uri)
      req.initialize_http_header(request_headers.merge({
        "Content-type" => "application/json"
      }))
      req.body = @params.to_json
      res = http.request(req)
      body = res.body ? JSON.parse(res.body, symbolize_names: true) : res.body
      unless res.is_a?(Net::HTTPSuccess)
        # TODO: handling errors
        error_class = res.is_a?(Net::HTTPClientError) ? TheBoard::ClientError : TheBoard::ServerError
        raise error_class.new(body.dig(:message))
      end
      body
    end

    def request_headers
      {
        "Authorization" => "Bearer #{TheBoard.api_token}",
        "x-api-key" => TheBoard.api_key
      }
    end
  end
end
