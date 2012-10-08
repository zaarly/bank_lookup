This is a tiny project that provides a super simple lookup table for bank routing numbers to bank names.

**Note**: Currently, we simply load the routing numbers and bank names into memory. There are approximately 20,656 banks in the database, so this will likely take up a few megabytes of memory in each process that loads the `BankLookup::DB` into memory.

## Usage

In your Gemfile:

```ruby
gem 'bank_lookup'
```

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
curl https://example.com/lookup/bank_name?number=121202211
# => {"name":"CHARLES SCHWAB BANK","pretty_name":"Charles Schwab Bank"}
```