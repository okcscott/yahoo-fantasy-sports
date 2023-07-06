module YahooFantasySports
  module Clients
    class Leagues < BaseClient
      def list(params = {})
        get(
          '/users;use_login=1/games;game_keys=nfl/leagues', 
          params,
          YahooFantasySports::League,
          ['fantasy_content', 'users', '0', 'user', 1, 'games', '0', 'game', 1, 'leagues']
        )
      end

      def metadata(league_key, params = {})
        get(
          "/league/#{league_key}/metadata",
          params,
          YahooFantasySports::League,
          ['fantasy_content', 'league', 0]
        )
      end
    end
  end
end