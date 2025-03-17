class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new
    #@user["first_name"] = params["first_name"] #removed
    #@user["last_name"] = params["last_name"] #removed
    @user["username"] = params["username"] #added this...
    @user["email"] = params["email"]
    @user["password"] = BCrypt::Password.create(params["password"])
    @user.save
    redirect_to "/login" #TO DO: something here. CHANGE THIS LATER BASED ON REQUIREMENTS
  end
end
