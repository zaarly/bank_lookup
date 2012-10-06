# See https://www.fededirectory.frb.org/format.cfm

require 'multi_json'
require 'sinatra'
require 'active_support/core_ext/string/inflections'

module BankLookup
  class Config
    class << self
      def file
        @file ||= File.join(File.dirname(__FILE__), '..', 'data', 'db.txt')
      end

      def file=(file)
        @file = file
      end
    end
  end

  DB = {}
  class Parser
    def self.parse
      # raise "You must specify a database file" if Config.file.nil?

      File.foreach Config.file do |line|
        number   = line[0..8]
        custname = line[27..62].strip

        DB[number] = custname
      end
    end
  end

  class API < Sinatra::Base
    # GET /bank_name?number=23413421
    get '/bank_name' do
      number = params['number']
      if name = DB[number]
        MultiJson.encode({:name => name, :pretty_name => name.titleize})
      else
        status 404
      end
    end
  end
end
