module TomatoShrieker
  class TweetTimelineSource < FeedSource
    def uris
      return config['/tweet/urls/root'].map do |href|
        uri = Ginseng::URI.parse(href)
        uri.path = File.join('/', account, 'rss')
        uri
      end
    end

    def uri
      return uris.first
    end

    def feedjira
      uris.each do |uri|
        return super(uri)
      rescue => e
        raise Ginseng::GatewayError, "invalid nitter instance (#{uri}) #{e.message}"
      end
    end

    def account
      return self['/source/tweet/account']
    end

    alias every period

    def ignore_entry?(entry)
      return true if entry.title&.match?(/^(RT by|R to)[[:blank:]]*/)
      return super
    end

    def create_record(entry)
      values = entry.to_h
      uri = Ginseng::URI.parse(values['url'])
      uri.host = 'twitter.com'
      uri.fragment = nil
      values['url'] = uri.to_s
      return super(values)
    end

    def self.all(&block)
      return enum_for(__method__) unless block
      Source.all.select {|s| s.is_a?(self)}.each(&block)
    end
  end
end
