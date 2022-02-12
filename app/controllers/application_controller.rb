class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_user_book, if: -> { current_user }

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def set_user_book
    @user_book = Book.new
  end

  def render_404
    render :file => "/public/404.html", :status => 404
  end
end
