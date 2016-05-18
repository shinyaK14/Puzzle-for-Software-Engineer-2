require 'rails_helper'

RSpec.describe CallMyApisController, type: :api do

  describe 'GET' do
    it 'returns 405 when access to index' do
      get "/call/my/APIs"
      expect(last_response.status).to eq(405)
    end

    it 'returns 404 when access to case' do
      get "/call/my/apis"
      expect(last_response.status).to eq(404)
    end

    it 'returns 404 when access to myapi' do
      get "/my/apis"
      expect(last_response.status).to eq(404)
    end

    it 'returns 404 when access to myapi' do
      get "/my/APIs"
      expect(last_response.status).to eq(404)
    end

    it 'returns 404 when access to something' do
      get "/something/something"
      expect(last_response.status).to eq(404)
    end

    it 'returns 404 when access to title' do
      get "/hack/me/if/you/can"
      expect(last_response.status).to eq(404)
    end

    it 'returns 404 when access to title' do
      get "/hackmeifyoucan"
      expect(last_response.status).to eq(404)
    end

    it 'returns 404 when access to think' do
      get "/callmyAPIs"
      expect(last_response.status).to eq(404)
    end

    it 'returns 200 when access to clue1' do
      get "/help/me/out"
      expect(last_response.status).to eq(200)
    end

    it 'returns 404 when access to clue11' do
      get "/helpmeout"
      expect(last_response.status).to eq(404)
    end

    it 'returns 404 when access to clue2' do
      get "/give/me/a/clue"
      expect(last_response.status).to eq(404)
    end

    it 'returns 404 when access to clue21' do
      get "/givemeaclue"
      expect(last_response.status).to eq(404)
    end

    it 'returns 404 when access to clue22' do
      get "/please"
      expect(last_response.status).to eq(404)
    end

    it 'returns 404 when access to clue22' do
      get "/Please"
      expect(last_response.status).to eq(404)
    end

    it 'returns 200 when access to clue3' do
      get "/please/give/me/a/clue"
      expect(last_response.status).to eq(200)
    end

    it 'returns 200 when access to clue3' do
      get "/Please/give/me/a/clue"
      expect(last_response.status).to eq(200)
    end

    it 'returns 200 when access to clue3' do
      get "/give/me/a/clue/please"
      expect(last_response.status).to eq(200)
    end
  end

  describe 'POST' do
    it 'returns 405 when access to create' do
      post "/call/my/APIs"
      expect(last_response.status).to eq(405)
    end
  end

  describe 'PUT' do
    it 'returns 405 when access to update' do
      put "/call/my/APIs"
      expect(last_response.status).to eq(405)
    end
  end

  describe 'PATCH' do
    it 'returns 405 when access to update' do
      patch "/call/my/APIs"
      expect(last_response.status).to eq(405)
    end
  end

  describe 'DELETE' do
    it 'returns 200 when access to destroy' do
      delete "/call/my/APIs"
      expect(last_response.status).to eq(200)
    end
  end
end
