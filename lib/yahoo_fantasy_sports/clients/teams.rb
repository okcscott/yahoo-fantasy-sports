module YahooFantasySports
  module Clients
    class Teams < BaseClient
      def list(league_key, params = {})
        get(
          "/league/#{league_key}/teams",
          params,
          YahooFantasySports::Team,
          ["fantasy_content","league", 1, "teams"]
        )
      end
    end
  end
end