class SessionsController < ApplicationController
  
  def new    
  end

  def create
    # we check if there is one user with the params email in our database, and store in a variable called "user"
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password]) # the method authenticate() comes from 'has_secure_password', in our user model
      # if user exists in our database, we 'logged' the user in the session and redirect to index page
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Welcome!'
    else
      # if not, log in page is rendered and alert message is displayed
      flash[:alert] = 'Invalid email or password'
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'See you later!'    
  end

end
