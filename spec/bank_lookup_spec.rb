require 'spec_helper'

describe BankLookup::DB do
  it 'allows looking up a number with a string number' do
    BankLookup::DB['011000015'].should == 'FEDERAL RESERVE BANK'
  end

  it 'does not allow looking up a number with an int number' do
    BankLookup::DB[011000015].should be_nil
  end
end