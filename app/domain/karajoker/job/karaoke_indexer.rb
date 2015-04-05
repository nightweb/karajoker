module Karajoker::Job
  class KaraokeIndexer
    include Base
    include Karajoker::Logger

    def run
      log_new_karaokes(@service.call(songs))
    end

    private

    def songs
      @crawler.songs(top: @top)
    end

    def log_new_karaokes(count)
      logger.info "#{count} new karaokes!"
    end

    def setup_top(top)
      if top.nil? || top == 0
        @top = 100
      else
        @top = top
      end
      logger.info "Top: #{@top}"
    end

    def initialize(top)
      @service = Service::KaraokeCreate.new
      @crawler = Crawler::BillboardSongHotCharts.new
      setup_top top
    end
  end
end
