class UsersController < ApplicationController
  require 'csv'

  def new
    @user = User.new
  end

  def create 
    @user = User.new(params[:user])
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
end
