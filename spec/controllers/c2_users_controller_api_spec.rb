require 'rails_helper'

RSpec.describe C2UsersController, type: :api do
  let(:user) { create :c2_user }

  describe 'index' do
    it 'returns 405 when access to index' do
      get '/c2_users'
      expect(last_response.status).to eq(405)
      expect(json['error']).to eq('GET? No. No.')
    end
  end

  describe 'create' do
    it 'returns 200 when create user' do
      post '/c2_users', { username: 'abc', email: 'abc@abc.com' }
      expect(last_response.status).to eq(200)
      expect(C2User.find_by(username: 'abc').email).to eq('abc@abc.com')
    end

    it 'returns 400 when fail to create user' do
      post '/c2_users'
      expect(last_response.status).to eq(400)
      expect(json['error']).to start_with('Validation Error')
      expect(json['error']).to include('name')
    end

    it 'returns 400 when fail to create user' do
      post '/c2_users', { username: 'abc' }
      expect(last_response.status).to eq(400)
      expect(json['error']).to start_with('Validation Error')
      expect(json['error']).to include('email')
    end
  end

  describe 'show' do
    it 'returns 200 when access to show with basic auth' do
      get "/c2_users/#{user.id}/#{user.username}"
      expect(json_message['id']).to eq(user.id)
      expect(last_response.status).to eq(200)
    end

    it 'returns 400 when access to show without basic auth' do
      get "/c2_users/#{user.id}"
      expect(json['error']).to start_with('ParameterMissing')
      expect(last_response.status).to eq(400)
    end
  end

  describe 'apply' do
    it 'returns 200 when access to apply with basic auth' do
      basic_authorize(user.username, user.password)
      get "/c2_users/#{user.id}/hacker_apply", { username: user.username, password: user.password }
      expect(json['message']).to start_with('Awesome!')
      expect(last_response.status).to eq(200)
    end

    it 'returns 401 when access to apply without basic auth' do
      get "/c2_users/#{user.id}/hacker_apply", { username: user.username, password: user.password }
      expect(json['error']).to start_with('Please authenticate')
      expect(last_response.status).to eq(401)
    end

    it 'returns 400 when access to apply with invalid id' do
      basic_authorize(user.username, user.password)
      get "/c2_users/#{user.id+3}/hacker_apply", { username: user.username, password: user.password }
      expect(json['error']).to start_with('Your id is a bit weird')
      expect(last_response.status).to eq(400)
    end
  end
end
