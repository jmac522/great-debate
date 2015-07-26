class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :profile_photo
  end

  def authenticate!
    unless signed_in?
      flash[:notice] = 'You need to sign in if you want to do that!'
      redirect_to homes_path
    end
  end
end
