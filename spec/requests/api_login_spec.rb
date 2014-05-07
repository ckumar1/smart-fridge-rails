require 'spec_helper'

describe 'API sign-in endpoint' do

  let(:valid_user) { create(:user) }
  let(:hostname) { 'http://api.smartfridge.com' }

  context 'for valid credentials' do
    before(:all) do
      post "#{hostname}/access", {email: valid_user.email, password: valid_user.password}.to_json,
           { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    end
    subject { response }

    its (:status) { should eq(200) }
    its (:body) { should_not be_nil }
    its (:content_type) { should eq(Mime::JSON)}


    its (:location) { should eq( user_url(valid_user.id ) )}

    context 'response body' do
      subject(:access_response) { JSON.parse(response.body, symbolize_names: true) }

      its ([:success]) { should eq(1) }
    end
  end

  context 'for invalid credentials' do
    before(:all) do
      post "#{hostname}/access", {email: valid_user.email, password: ''}.to_json,
           { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    end

    subject { response }

    its (:status) { should eq(422) }
    its (:body) { should_not be_nil }
    its (:content_type) { should eq(Mime::JSON)}
  end
end