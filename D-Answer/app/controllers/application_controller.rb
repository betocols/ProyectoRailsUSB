class ApplicationController < ActionController::Base
  #before_filter :authenticate_user!
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  helper_method :is_authorize
  def is_authorize
      redirect_to(questions_path) if current_user.id.to_s != params[:id] and current_user.role != "admin" 
  end

  helper_method :is_admin
  def is_admin
      redirect_to(:back) if current_user.role == "user"
  end

  helper_method :is_owner
  def is_owner
      redirect_to(:back) if current_user.id.to_s != params[:id]
  end
end
