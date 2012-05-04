class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  
  def create 
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:success] = "Post save message"
  	else 
  		render 'new'
  	end
  end
end
