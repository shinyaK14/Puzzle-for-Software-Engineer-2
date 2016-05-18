class C2UsersController < ApplicationController
  require 'socket'
  require 'base64'

  skip_before_action :verify_authenticity_token

  before_action :build_user, only: :create
  before_action :check_user, only: :show
  before_action :basic, only: :apply
  before_action :set_user_when_update, only: :update

  def index
    render json: { error: "GET? No. No." }, status: 405
  end

  def create
    if @user.save
      render json: user_json
    else
      render json: { error: "Validation Error - #{@user.errors.first}" }, status: 400
    end
  end

  def show
    if @user && @user.comment.nil?
      render json: { message: user_json }
    else
      render json: { error: \
"ParameterMissing - You wanna see your record again? Ok. Put your username \
after your id. e.g. c2_users/7/Ronaldo" \
      }, status: 400
    end
  end

  def apply
    if @user
      comment_url_if_id_is_correct
    else
      render json: { error: \
"Please authenticate using Basic Auth with your username and password. \
You want a clue? Shout out 'help/me/out'" \
      }, status: 401
    end
  end

  def update
    return if @user.nil?
    if @user.comment.present?
      redirect_to root_path, alert: "You've already left your comment"
    else
      check_update
    end
  end

  private

  def user_params
    params.permit(:username, :email, :comment)
  end

  def user_comment_params
    params[:c2_user].permit(:username, :email, :comment)
  end

  def build_user
    @user = C2User.new(user_params)
  end

  def check_user
    @user = C2User.find(params[:id])
    @user = nil if @user && @user.username != params[:username]
  end

  def comment_url_if_id_is_correct
    if @user.id == params[:id].to_i
      render json: { message: "Awesome! Can you come over here? === #{comment_url}\
      You want a clue? Shout out 'give me a clue'" }
    else
      render json: { error: "Your id is a bit weird. Can you check it?" }, status: 400
    end
  end

  def comment_url
    url = 'Good job!! Please access to the url from your web browser. === \
http://challenge-your-limits2.herokuapp.com/winner_comments/' + @user.token
    Base64.strict_encode64(url)
  end

  def basic
    authenticate_with_http_basic do |username, password|
      user = C2User.find_by(password: password)
      @user = user if user.present? && user.username == username
    end
  end

  def user_json
    u_json = @user.to_json
    u_json[0..u_json.index("token")-3] << '}'
  end

  def set_user_when_update
    @user = C2User.find_by(password: params[:c2_user][:token]) if params[:c2_user].present?
  end

  def check_update
    if @user.update(user_comment_params)
      redirect_to winners_path, notice: 'Thank you for your message!'
    else
      redirect_to comment_path(token: @user.token), alert: "Please leave your comment"
    end
  end
end
