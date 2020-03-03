require 'rails_helper'

RSpec.describe 'create user' do


  it 'works' do
    post '/api/v1/users', params: {
      email: 'test@example.com',
      password: 'password'
    }

    expect(response).to be_successful
    body = JSON.parse(response.body)

    expect(body).to eq({'api_key' => User.last.api_key})
  end

  it 'does not work' do
    post '/api/v1/users', params: {
      password: 'password'
    }

    expect(response.status).to eq(400)
    body = JSON.parse(response.body)

    expect(body).to eq({'errors' => "Email can't be blank"})
  end
end
