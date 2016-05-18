class CommentChecker < ActiveRecord::Base
  validates :word, presence: true, uniqueness: true
end
