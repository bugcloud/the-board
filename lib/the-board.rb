require "the-board/version"
require "the-board/configuration"
require "the-board/error"
require "the-board/api_client"
require "the-board/resource"
require "the-board/resources/client"
require "the-board/resources/contact"
require "the-board/resources/project"
require "the-board/resources/document/estimate"
require "the-board/resources/document/invoice"

module TheBoard
  extend Configuration
end
