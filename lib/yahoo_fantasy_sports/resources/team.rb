module YahooFantasySports
  class Team < BaseResource
    attr_reader :name, :team_key

    def self.load_from_response(data)
      data = JSON.parse(data) if data.is_a?(String)
      mapped_data = []

      ts = data.dig("fantasy_content","league",1, "teams")

      mapped_data = ts["count"].times.map do |i|
        ts["#{i}"]["team"][0].map { |x| x.is_a?(Array) ? nil : x }.compact.reduce Hash.new, :merge
      end

      super(mapped_data)
    end
  end
end