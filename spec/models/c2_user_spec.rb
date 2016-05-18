require 'rails_helper'

RSpec.describe C2User, type: :model do
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:email) }

  let(:user) { create :c2_user }
  let!(:comment_checker) { create :comment_checker, word: 'abc'}

  it 'has email validation' do
    user.email = 'abc@abc'
    expect(user.valid?).to eq(false)
  end

  it 'has password and token when it saved' do
    expect(user.token).not_to eq(nil)
    expect(user.password).not_to eq(nil)
  end

  it 'replaces irrelevant comment when update' do
    user.comment = '123 abc 456'
    user.save
    expect(user.comment).not_to include('abc')
  end
end
