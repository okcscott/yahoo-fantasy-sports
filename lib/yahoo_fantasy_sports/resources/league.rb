module YahooFantasySports
  class League < BaseResource
    attr_reader :league_key, :name, :num_teams, :season

    def self.load_from_response(data, path_to_object = nil)
      data = JSON.parse(data) if data.is_a?(String)
      mapped_data = []

      ls = path_to_object ? data.dig(*path_to_object) : data

      mapped_data = ls.has_key?("count") ? self.mapLeagues(ls) : ls

      super(mapped_data)
    end

    def self.mapLeagues(ls)
      ls['count'].times.map do |i|
        ls["#{i}"]['league'][0]
      end
    end
  end
end