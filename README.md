# Capital One API Ruby client

Ruby client for the Capital One API provided during the
[People & Money Hackathon](http://capitalonepmh.challengepost.com/) in March
2015.

## Installation

Add this line to your application's Gemfile (assuming you cloned the repository
in the same directory as your working project):

```ruby
gem 'capitalone_client', path: '../capitalone_client'
```

And then execute:

    $ bundle

## Usage

```ruby
require 'capitalone_client'

# log into Capital One
login_result = CapitalOneClient.login(email: 'YOUR_EMAIL', password: 'YOUR_PASSWORD')

# prepare the credentials to be used
credentials = {
  user_id:              login_result.uid,
  authentication_token: login_result.token,
  api_token:            'API_TOKEN'
}

# get a client session
session = CapitalOneClient.session(credentials)

# list accounts
accounts = session.accounts

# list transactions
transactions = session.transactions

# find the projected transactions for a given month
projected = session.projected_transactions(month: 'MONTH', year: 'YEAR')

# find similar transactions
similar = session.similar_transactions(['TRANSACTION_IDS'])

# find the daily balances for this user
balances = session.balances
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/capitalone_client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
