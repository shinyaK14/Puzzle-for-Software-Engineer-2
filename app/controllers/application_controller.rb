class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  rescue_from ActionView::MissingTemplate, with: :not_this_way
  rescue_from ActionController::RoutingError, with: :not_this_way
  rescue_from ActionController::UnknownHttpMethod, with: :not_this_way
  rescue_from ActionController::ParameterMissing, with: :params_missing
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def not_this_way
    render json: { error: "No No. Not this way" }, status: 404
  end

  def params_missing
    render json: { error: "ParameterMissing (param is missing or the value is empty)" }, status: 404
  end

  def record_not_found
    render json: { error: "Record not found. Is your :id correct?" }, status: 404
  end
end
