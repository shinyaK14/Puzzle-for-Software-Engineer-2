class CommentsController < ApplicationController
  require 'socket'

  skip_before_action :verify_authenticity_token

  def new
    @user = C2User.find_by(token: params[:token])
    redirect_to root_path, alert: 'Your token is not valid' if @user.nil?
  end
end
