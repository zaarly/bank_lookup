This is a tiny project that provides a super simple lookup table for bank routing numbers to bank names.

## Usage

You need to instruct the gem to parse the database file. This gem ships with a file that will be periodically updated (you can also suppply your own).

In an initializer, make sure you load the DB by parsing the data file:

```ruby
# config/initializers/bank_lookup.rb
BankLookup::Parser.parse
```

Mount the API in your router:

```ruby
MyApp::Application.routes.draw do
  mount BankLookup::API => 'lookup'
end
```

Now get some bank names:

```
curl https://example.com/lookup/bank_name?number=011000015
# => {"name":"FEDERAL RESERVE BANK OF BOSTON","pretty_name":"Federal Reserve Bank Of Boston"}
```