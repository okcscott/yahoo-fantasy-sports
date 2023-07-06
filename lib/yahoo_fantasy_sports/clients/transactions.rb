module YahooFantasySports
  module Clients
    class Transactions < BaseClient
      def list(league_key, params = {})
        get(
          "/league/#{league_key}/transactions;types=add,drop,trade",
          params,
          YahooFantasySports::Transaction,
          ["fantasy_content", "league", 1, "transactions"]
        )
      end
    end
  end
end