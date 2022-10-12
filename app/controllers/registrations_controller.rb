class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # create a new user object with the parameters obtained through the form
    @user = User.new(user_params)
    
    if @user.save      
      # if is a valid user to be saved, then we store it in the database
      # Then we store the user id in the encrypted cookie that rails offers --> session hash
      session[:user_id] = @user.id #--> Doing this, we are remembering who user is loged in
      # and next, we redirect the user to the index page
      redirect_to root_path, notice: 'User has been created successfully'
    else
      # if the user data is not valid, the 'registrations#new' action will be rendered
      render :new, status: :unprocessable_entity 
      # Rails 7 has Hotwire enabled by default, and it will validate the response 
      # status code. For failed validation, the status code should be 422 (Unprocesssable entity). 
      # Otherwise, Hotwire may believe the form is valid
    end
  end

  private
    # this private method help us to keep the application secure, only allowing known parameters
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation) # require a user object with the permited params
    end
end
