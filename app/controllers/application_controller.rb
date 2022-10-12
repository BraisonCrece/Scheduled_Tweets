class ApplicationController < ActionController::Base
  before_action :set_current_user # with this callback we ensure that before any action, we set the current user,
                                  # so we can use it when we need

  def set_current_user
    if session[:user_id]
      # we are using the method 'find_by' instead of 'find', 
      # because if there is no user in our database with the same id that is stored in the session, 
      # it will throw an error. But 'find_by' dont, will return 'nil'
      Current.user = User.find_by(id: session[:user_id]) 
      # here we are using the class Current, to store in his attribute 'user' the current user
    end
  end

      
end
