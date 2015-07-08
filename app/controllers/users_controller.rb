class UsersController < ApplicationController
  require 'csv'

  before_action :verify_token, only: [:index, :export_csv]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "POST save message"
      redirect_to '/success'
      UserMailer.registration_confirmation(@user).deliver
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end

  def export_csv
    @users = User.all
    user_csv = CSV.generate do |csv|
      #header row
      csv <<["Email", "UserType"]
      #data row
      @users.each do |user|
        csv <<[user.email, user.usertype]
      end
    end
    send_data(user_csv, :type => 'text/csv', :filename => 'user_record.csv')
  end

  private

  def user_params
    user_params = params.require(:user).permit(:email, :usertype)
    usertype = user_params[:usertype]
    usertype = usertype.to_i if usertype.to_i
    user_params
  end

  def verify_token
    password = ENV["AUTH_TOKEN"] || "i0nlyPass"
    unless params[:token].present? and params[:token] == password
      render text: "You Shall Not Pass!"
    end
  end
end
