class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_organization
    current_organization ||= Organization.find_with_subdomain(request.subdomain)
  end

  helper_method :current_organization
end
