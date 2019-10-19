# frozen_string_literal: true
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  APIresponse = Struct.new(:status, :message ,:data)

  
  protect_from_forgery with: :null_session

  #define error responses on invalid requests
  def error
    render status_code.to_s, status: (params[:code] || 500)
  end

  def authenticate_api_access_token
    token = params[:auth]
    if token == ENV["API_ACCESS_TOKEN"]
    else respond_to :json
      message = "Invalid resource access token"
      render json: message.to_json
    end
  end
  def authenticate_api_modify_token
    token = params[:auth]
    if token == ENV["API_MODIFY_TOKEN"]
    else respond_to :json
      message = "Invalid resource modify token"
      render json: message.to_json
    end
  end

  def API_respond(status, message, data)
    response = APIresponse.new(status:status, message:message, data:data)
    render json: response.to_json, status: status
  end
end
