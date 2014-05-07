require 'spec_helper'

describe 'API Sign-Up Endpoint' do

  # whatever you set as the hostname must be entered into your /etc/hosts file
  # example:
  #
  #   ## /etc/hosts
  #   127.0.0.1 api.fridgepantry.com
  let(:hostname) { 'http://api.fridgepantry.com/api' }

  let(:valid_user) { build(:user) }
  let(:created_user) {User.find_by(email: valid_user.email)}
  let(:accept_json) { { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s } }

  context 'for valid credentials' do
    let(:valid_request) { {name: valid_user.name, email: valid_user.email,
                           password: valid_user.password}.to_json }
    before(:each) { post "#{hostname}/access/new", valid_request, accept_json }

    subject { response }

    its (:status) { should eq(200) }
    its (:body) { should_not be_nil }
    its (:content_type) { should eq(Mime::JSON)}
    its (:location) { should eq( user_url(created_user.id) )}

    context 'response body' do
      subject(:access_response) { JSON.parse(response.body, symbolize_names: true) }

      its ([:success]) { should eq(1) }

    end
  end

  context 'for invalid credentials' do
    let(:invalid_request) { {name: valid_user.name, email: valid_user.email,
                           password: ''}.to_json }
    before(:each) { post "#{hostname}/access/new", invalid_request, accept_json }

    subject { response }

    its (:status) { should eq(422) }
    its (:body) { should_not be_nil }
    its (:content_type) { should eq(Mime::JSON)}
  end

end





