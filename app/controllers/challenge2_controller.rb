class Challenge2Controller < ApplicationController
  def index
    @users = C2User.where.not(comment: nil).order("updated_at DESC").limit(12)
    @count= C2User.where.not(comment: nil).count
  end

  def winners
    @users = C2User.where.not(comment: nil).order("updated_at DESC").page(params[:page])
  end
end
