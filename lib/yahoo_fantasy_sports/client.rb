require 'oauth2'

module YahooFantasySports
  class Client
    attr_accessor :client_id, :client_secret, :oauth2_client, :access_token

    def initialize(client_id, client_secret)
      @client_id = client_id
      @client_secret = client_secret
      @oauth2_client = OAuth2::Client.new(
        @client_id, 
        @client_secret, 
        site: 'https://api.login.yahoo.com',
        authorize_url: '/oauth2/request_auth',
        token_url: '/oauth2/get_token',
      )
    end

    def authorize_url(redirect_uri, state = nil)
      params = { redirect_uri: redirect_uri }
      params[:state] = state if state
      @oauth2_client.auth_code.authorize_url(params)
    end

    def get_token(code, redirect_uri)
      @oauth2_client.auth_code.get_token(code, redirect_uri: redirect_uri)
    end

    def refresh_token(refresh_token)
      @access_token = OAuth2::AccessToken.from_hash(@oauth2_client, {refresh_token: refresh_token}).refresh!
    end

    def leagues
      @leagues ||= YahooFantasySports::Clients::Leagues.new(self)
    end

    def teams
      @teams ||= YahooFantasySports::Clients::Teams.new(self)
    end

    def transactions
      @transactions ||= YahooFantasySports::Clients::Transactions.new(self)
    end
  end
end