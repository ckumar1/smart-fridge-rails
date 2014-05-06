require 'rspec'

describe 'API sign-in endpoint' do

  let(:valid_user) { create(:user) }

  context 'for valid credentials' do
    before(:all) { api_post '/access', {email: valid_user.email, password: valid_user.password} }
    subject { response }

    its ([:status]) { should eq(200) }

    it 'should have the key: success == 1' do
    end

    it 'should have the key: success == 1' do
    end

    it 'should have the key: success == 1' do
    end
  end
end