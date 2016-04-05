class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

   def require_user
    if current_user.nil?
      flash[:error] = "You must be logged in to access this section"
      redirect_to posts_path # halts request cycle
    end
    # redirect_to posts_path unless current_user
   end 

end
