module YahooFantasySports
  class DraftPick < BaseResource
    attr_accessor :source_team_key, :destination_team_key, :original_team_key, :round

    def self.map_picks(ps)
      ps.map { |p| p["pick"] }
    end
  end
end