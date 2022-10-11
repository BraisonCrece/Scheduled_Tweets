class MainController < ApplicationController
  def index
    # now when we have a user logged in, we can store this user in a variable, so we can use the user data if we need 
    if session[:user_id]
      # we are using the method 'find_by' instead of 'find', 
      # because if there is no user in our database with the same id that is stored in the session, 
      # it will throw an error. But 'find_by' dont
      @user = User.find_by(id: session[:user_id])
    end
  end
end
