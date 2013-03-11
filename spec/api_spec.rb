require 'spec_helper'

describe BankLookup::API, 'GET /bank_name' do 
  def app
    BankLookup::API.new
  end

  def get(url)
    Rack::MockRequest.new(app).get(url)
  end

  describe "when passed a number that exists in the db" do 
    it 'responds with 200' do 
      get("/bank_name?number=011000015").status.should == 200
    end

    it 'responds with json content type' do 
      get("/bank_name?number=011000015").content_type.should =~ /json/
    end

    it 'responds with name and pretty name keys' do
      data = MultiJson.decode(get("/bank_name?number=011000015").body)
      data.should have_key 'name'
      data.should have_key 'pretty_name'
    end

    it 'strips whitespace from the front' do
      get("/bank_name?number=%20011000015").status.should == 200
    end

    it 'strips whitespace from the end' do
      get("/bank_name?number=011000015%20").status.should == 200
    end
  end

  describe 'when passed a number that does not exist' do
    it 'responds with 404' do
      get('/bank_name?number=234').status.should == 404
    end

    it 'responds with json' do
      get('/bank_name?number=234').content_type.should =~ /json/
    end
  end

  describe 'when not passed a number param' do
    it 'responds with 400' do
      get('/bank_name').status.should == 400
    end

    it 'responds with an error message' do
      MultiJson.decode(get('/bank_name').body).should == {'error' => '"number" param is required'}
    end

    it 'responds with a text content type' do
      get('/bank_name').content_type.should =~ /json/
    end
  end
end