module TomatoShrieker
  class WebhookShriekerTest < TestCase
    def test_exec
      Source.all.select(&:test?).select(&:webhook?).each do |source|
        source.clear
        source.exec
      end
    end
  end
end
