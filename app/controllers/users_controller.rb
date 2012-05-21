class UsersController < ApplicationController
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
  		render root_path
  	end
  end
end
