require 'bitly'
require 'addressable/uri'

module TomatoToot
  class Bitly
    def initialize
      ::Bitly.use_api_version_3
      ::Bitly.configure do |config|
        config.api_version = 3
        config.access_token = Config.instance['/bitly/token']
      end
      @service = ::Bitly.client
    end

    def shorten(uri)
      return Addressable::URI.parse(@service.shorten(uri.to_s).short_url)
    end
  end
end
