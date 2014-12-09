class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #Do logging in stuff
    else
      #Create and display the error message "cant log in"
      render 'new'
    end
  end
  
  def destroy
  end
  
end
