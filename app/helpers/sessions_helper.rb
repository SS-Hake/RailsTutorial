module SessionsHelper
  
  #logs in the provided user
  def log_in(user)
    session[:user_id] = user.id
  end
  
  #returns the current user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  #User logged in?
  def logged_in?
    !current_user.nil?
  end
  
  # Logs the current user out
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
end
