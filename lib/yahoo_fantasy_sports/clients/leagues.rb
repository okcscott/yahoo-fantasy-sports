module YahooFantasySports
  module Clients
    class Leagues < BaseClient
      def list(params = {})
        get(
          '/users;use_login=1/games;game_keys=nfl/leagues', 
          params,
          YahooFantasySports::League
        )
      end
    end
  end
end