class ApplicationController < ActionController::Base
  before_filter :update_sanitized_params, if: :devise_controller?

     protect_from_forgery with: :exception 

  end

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:profile_name, 
      :email, :first_name, :last_name, :password) }
  end
  
  private
  def status_params
        params.require(:status).permit(:user_id, :content, document_attributes: [:attachment, :remove_attachment] ) if params[:status]
      end