module YahooFantasySports
  class Transaction < BaseResource
    attr_reader :transaction_key, :players, :picks, :type, :status, :timestamp, :trader_team_key, :tradee_team_key

    def self.load_from_response(data)
      data = JSON.parse(data) if data.is_a?(String)
      mapped_data = []

      ts = data.dig("fantasy_content", "league", 1, "transactions")

      mapped_data = self.map_transaction(ts)

      super(mapped_data)
    end

    def self.map_transaction(ts)
      ts["count"].times.map do |i|
        meta = ts["#{i}"]["transaction"][0].except("picks")
        picks = ts["#{i}"]["transaction"][0].dig("picks")
        players = ts["#{i}"]["transaction"]&.[](1)&.[]("players")

        if players
          players = YahooFantasySports::Player.load_from_response(YahooFantasySports::Player.map_players(players))
        end

        if picks
          picks = YahooFantasySports::DraftPick.load_from_response(YahooFantasySports::DraftPick.map_picks(picks))
        end
        
        meta.merge!({
          players: players || [],
          picks: picks || []
        })
      end
    end
  end
end
