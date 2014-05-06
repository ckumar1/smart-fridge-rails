require 'spec_helper'

describe 'API sign-in endpoint' do

  let(:valid_user) { create(:user) }
  let(:hostname) { 'http://api.smartfridge.com' }

  context 'for valid credentials' do
    before(:all) do
      post "#{hostname}/access", {email: valid_user.email, password: valid_user.password}
    end
    subject { response }

    its ([:status]) { should eq(200) }
    its ([:body]) { should_not be_empty }

    context 'response body' do
      subject { response.body }

      its ([:success]) { should eq(1) }
    end

  end
end