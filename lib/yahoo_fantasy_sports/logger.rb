require 'logger'

module YahooFantasySports
  class Logger
    def self.info(message)
      logger = ::Logger.new($stdout)
      logger.info(message)
    end
  end
end