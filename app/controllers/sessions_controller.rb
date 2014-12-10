class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #if user name and password match log them in the the method created in sessions_helper
      log_in user
      redirect_to user
    else
      #Create and display the error message "cant log in"
      flash.now[:danger] = 'Invalid email or password'
      render 'new'
    end
  end
  
  def destroy
  end
  
end
