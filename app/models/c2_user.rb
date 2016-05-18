class C2User < ActiveRecord::Base
  validates :username, presence: true
  validates :username, length: { maximum: 20 }
  validates :username, format: { with: /\A[a-z0-9]+\z/i, message: 'Only single-byte characters are allowed. A-Z, a-z & 0-9' }
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :comment, presence: true, on: :update

  before_save :create_password
  before_save :create_token
  before_update :replace_irrelevant_comment

  private

  def create_password
    self.password = SecureRandom.urlsafe_base64(12).html_safe
  end

  def create_token
    self.token= SecureRandom.urlsafe_base64(12).html_safe
  end

  def replace_irrelevant_comment
    CommentChecker.all.each do |checker|
      self.comment = self.comment.gsub(/#{checker.word}/,'...')
    end
  end
end
