require 'rails_helper'

RSpec.describe 'create session' do
  before :each do
    @user = create :user, password: 'password'
  end

  it 'works' do
    post '/api/v1/sessions', params: {
      email: 'test@email.com',
      password: 'password'
    }

    expect(response).to be_successful
    body = JSON.parse(response.body)

    expect(body).to eq({'api_key' => @user.api_key})
  end
end
