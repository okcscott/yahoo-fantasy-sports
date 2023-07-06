module YahooFantasySports
  class Team < BaseResource
    attr_reader :name, :team_key

    def self.load_from_response(data, path_to_object = nil)
      data = JSON.parse(data) if data.is_a?(String)
      mapped_data = []

      ts = path_to_object ? data.dig(*path_to_object) : data

      mapped_data = self.map_teams(ts)

      super(mapped_data)
    end

    def self.map_teams(ts)
      ts["count"].times.map do |i|
        ts["#{i}"]["team"][0].map { |x| x.is_a?(Array) ? nil : x }.compact.reduce Hash.new, :merge
      end
    end
  end
end