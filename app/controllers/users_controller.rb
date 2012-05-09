class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  
  def create 
  	@user = User.new(params[:user])
  	if @user.save
  		UserMailer.registration_confirmation(@user).deliver
  		flash[:success] = "POST save message"
  		redirect_to '/success', :notice => 'Thanks for signing up!'
  	else 
  		render root_path
  	end
  end
end
