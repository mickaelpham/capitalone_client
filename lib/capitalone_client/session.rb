module CapitalOneClient
  class Session < Support::BaseSession
    base_url  'https://api.levelmoney.com'
    base_path '/api/v2/hackathon'

    # Accounts
    # POST https://api.levelmoney.com/api/v2/hackathon/get-accounts
    def accounts
      fetch :post, '/get-accounts'
    end

    # Transactions
    # POST https://api.levelmoney.com/api/v2/hackathon/get-all-transactions
    def transactions
      fetch :post, '/get-all-transactions'
    end

    # POST https://api.levelmoney.com/api/v2/hackathon/projected-transactions-for-month
    def projected_transactions(month:, year:)
      data = { month: month.to_i, year: year.to_i }
      fetch :post, '/projected-transactions-for-month', data: data
    end

    # POST https://api.levelmoney.com/api/v2/hackathon/find-similar-transactions
    def similar_transactions(transaction_ids)
      data = { 'transaction-ids' => transaction_ids }
      fetch :post, '/find-similar-transactions', data: data
    end

    # Balances
    # POST https://api.levelmoney.com/api/v2/hackathon/balances
    def balances
      fetch :post, '/balances'
    end

    # Login
    # POST https://api.levelmoney.com/api/v2/hackathon/login
    def login(email:, password:)
      data = { email: email, password: password }
      fetch :post, '/login', data: data
    end
  end
end
