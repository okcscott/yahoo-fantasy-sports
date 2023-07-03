module YahooFantasySports
  class Player < BaseResource
    attr_reader :player_key, :player_id, :type, :source_type, :source_team_key, :destination_type, :destination_team_key

    def self.map_players(ps)
      ps["count"].times.map do |i|
        player = { }
        player.merge!(ps["#{i}"]["player"][0].map { |x| x.is_a?(Array) ? nil : x }.compact.reduce Hash.new, :merge)

        transaction_data = {}
        t = ps["#{i}"]["player"][1]["transaction_data"]
        transaction_data.merge!((t.is_a?(Array) ? t[0] : t))

        player.merge!(transaction_data)

        player
      end
    end
  end
end