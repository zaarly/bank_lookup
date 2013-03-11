require 'rubygems'
require 'bundler/setup'

ENV['RACK_ENV'] ||= 'test'

$:.push File.dirname(File.expand_path(__FILE__))
$:.push(File.join(File.dirname(File.expand_path(__FILE__)), '..', 'lib'))

require 'bank_lookup'

Bundler.setup :default, :test
Bundler.require :default, :test

BankLookup::Parser.parse

RSpec.configure do |c|
end