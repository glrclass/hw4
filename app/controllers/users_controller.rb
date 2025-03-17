class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new
    @user["first_name"] = params["first_name"] #TO DO: currently this is an issue / error. not sure why. Maybe need to change to username? 
    @user["last_name"] = params["last_name"]
    @user["email"] = params["email"]
    @user["password"] = params["password"]
    @user.save
    redirect_to "/users/#{@user["id"]}" #TO DO: something here. CHANGE THIS LATER
  end
end
