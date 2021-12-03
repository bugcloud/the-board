module TheBoard
  module Configuration
    VALID_CONFIG_KEYS = {
      api_key: nil,
      api_token: nil
    }.freeze

    attr_accessor(* VALID_CONFIG_KEYS.keys)

    def configure
      yield self
    end
  end
end
