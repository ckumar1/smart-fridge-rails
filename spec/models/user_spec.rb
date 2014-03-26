require 'spec_helper'

describe User do


  it 'has a new valid factory' do
    expect( create :user ).to be_valid
  end

  it 'is invalid without a name' do
    expect( build :user, name: nil ).to_not be_valid
  end

  it 'is invalid without an email' do
    expect( build :user, email: nil ).to_not be_valid
  end

end
