module YahooFantasySports
  class League < BaseResource
    attr_reader :league_key, :name, :num_teams, :season

    def self.load_from_response(data)
      data = JSON.parse(data) if data.is_a?(String)
      mapped_data = []

      ls = data.dig('fantasy_content', 'users', '0', 'user', 1, 'games', '0', 'game', 1, 'leagues')

      mapped_data = ls['count'].times.map do |i|
        ls["#{i}"]['league'][0]
      end

      super(mapped_data)
    end
  end
end