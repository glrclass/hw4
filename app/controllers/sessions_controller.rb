class SessionsController < ApplicationController
  def new
  end

  def create
  end

  def destroy
  end
end

# In the sessions controller, authenticate the user by email and password. 
#  If successful, "log them in" (i.e. assign the user's id to the session hash) and redirect to the PLACES index. 
#  If unsuccessful, redirect back to LOGIN.

# Query for the logged-in user to conditionally show the login/signup links or a logout link (using the user's id in the session hash).

# In the sessions controller, "logout" a logged-in user (i.e. remove the user's id from the session hash) and redirect to login.

  