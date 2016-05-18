require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:user) { create :c2_user }

  describe 'GET #new' do
    it 'returns http success with correct token' do
      get :new, token: user.token
      expect(assigns[:user]).to eq(user)
      expect(response).to have_http_status(:success)
    end

    it 'redirects to root_path with invalid token' do
      get :new, token: 'abc'
      expect(subject).to redirect_to(root_path)
    end
  end
end
