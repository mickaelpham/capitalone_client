module CapitalOneClient
  class Session
    def initialize(user_id, authentication_token, api_token)
      @user_id              = user_id
      @authentication_token = authentication_token
      @api_token            = api_token
    end
  end
end
