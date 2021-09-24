module TomatoShrieker
  class TextSource < Source
    def exec
      shriek(template: template, visibility: visibility)
      logger.info(source: id, message: 'post')
    end

    def template
      template = super
      template[:status] = self['/source/text']
      template[:source] = self
      return template
    end

    def self.all(&block)
      return enum_for(__method__) unless block
      Source.all.select {|s| s.is_a?(TextSource)}.each(&block)
    end
  end
end
