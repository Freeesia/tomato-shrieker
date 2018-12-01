require 'json'

module TomatoToot
  class JSONRenderer < Renderer
    attr_accessor :message

    def to_s
      return @message.to_json
    end
  end
end
