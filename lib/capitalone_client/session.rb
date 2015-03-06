module CapitalOneClient
  class Session < Support::BaseSession
    base_url  'https://api.levelmoney.com'
    base_path '/api/v2/hackathon'

    # Accounts
    # POST https://api.levelmoney.com/api/v2/hackathon/get-accounts
    def accounts
      fetch :post, '/get-accounts'
    end
  end
end
