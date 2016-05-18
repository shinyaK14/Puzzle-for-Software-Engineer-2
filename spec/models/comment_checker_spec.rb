require 'rails_helper'

RSpec.describe CommentChecker, type: :model do
  it { is_expected.to validate_presence_of(:word) }
end
