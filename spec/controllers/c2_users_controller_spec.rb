require 'rails_helper'

RSpec.describe C2UsersController, type: :controller do
  let(:user) { create :c2_user }

  describe 'update' do
    it 'returns 302 when update a comment' do
      patch :update, { id: user.id, c2_user: { token: user.password, comment: 'comment abc' } }
      expect(C2User.find(user.id).comment).to eq('comment abc')
      expect(response.status).to eq(302)
      expect(subject).to redirect_to(winners_path)
    end

    it 'returns 404 with invalid token' do
      patch :update, { id:user.id, c2_user: { token: 'aaa' } }
      expect(response.status).to eq(404)
    end

    it 'redirects to root if user has already commented' do
      user.update(comment: 'comment abc')
      patch :update, { id: user.id, c2_user: { token: user.password } }
      expect(subject).to redirect_to(root_path)
    end
  end
end
