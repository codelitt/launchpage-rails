class ApplicationController < ActionController::Base
  protect_from_forgery

  def verify_token
    password = ENV["AUTH_TOKEN"] || "i0nlyPass"
    unless params[:token].present? and params[:token] = password
      render text: "You Shall Not Pass!"
    end
  end

end
