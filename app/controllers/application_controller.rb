class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit::Authorization
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  def user_not_authorized
    if current_user || !request.get?
      redirect_to root_path
    else
      redirect_to new_user_session_path(return_to: request.url)
    end
  end

end
