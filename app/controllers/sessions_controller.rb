class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user #check secret password
      if BCrypt::Password.new(@user["password"]) == params["password"] #login the user
        session["user_id"] = @user["id"]
        flash["notice"] = "You've logged in!"
        redirect_to "/places"
      else
        flash["notice"] = "Unsuccessful login."
        redirect_to "/sessions/new"
      end
    else
      flash["notice"] = "Unsuccessful login."
      redirect_to "/sessions/new"
    end
  end

  def destroy
    flash["notice"] = "Goodbye."
    session["user_id"] = nil
    redirect_to "/sessions/new"
  end
end

# In the sessions controller, authenticate the user by email and password. 
#  If successful, "log them in" (i.e. assign the user's id to the session hash) and redirect to the PLACES index. 
#  If unsuccessful, redirect back to LOGIN.

# Query for the logged-in user to conditionally show the login/signup links or a logout link (using the user's id in the session hash).

# In the sessions controller, "logout" a logged-in user (i.e. remove the user's id from the session hash) and redirect to login.

  