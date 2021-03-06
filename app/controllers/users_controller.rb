class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create 
    @user = User.new(user_params)
    if @user.save
      #This returns true if it can save successfully
      log_in @user
      flash[:success] = "Welcome to Chirp!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  #These methods are only used internally and as such can be 'private'
  private
    #This method ensures that publlic users have access only to the parameters 
    #of @user we want themto have - disallows users to set thier own admin 
    #priviledges.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  
end
