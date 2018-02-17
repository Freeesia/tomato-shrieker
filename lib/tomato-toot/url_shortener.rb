require 'json'
require 'addressable/uri'
require 'httparty'
require 'tomato-toot/config'

module TomatoToot
  class URLShortener
    def initialize
      @config = Config.new
    end

    def shorten (url)
      return HTTParty.post(service_url, {
        body: {longUrl: url.to_s}.to_json,
        headers: {'Content-Type' => 'application/json'},
      })['id']
    end

    private
    def service_url
      url = Addressable::URI.parse(@config['application']['url_shortener']['url'])
      query = url.query_values || {}
      query['key'] = @config['local']['url_shortener']['api_key']
      url.query_values = query
      return url
    end
  end
end
