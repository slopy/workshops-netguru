class ApplicationController < ActionController::Base

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protect_from_forgery with: :exception


  def user_is_admin?
  	unless current_user.admin?
  		redirect_to new_user_session_path
  	end
  end
end
