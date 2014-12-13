class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :get_layout

  def current_organization
    current_organization ||= Organization.find_with_subdomain(request.subdomain)
  end

  def current_subdomain
    get_subdomain(current_organization)
  end

  def get_subdomain(organization)
    organization.slug
  end

  helper_method :current_organization, :get_subdomain, :current_subdomain

  private
    def get_layout
      if current_organization.present?
        uri = current_organization.slug + '_layout'
        uri.to_s.downcase
      else
        'application'
      end
    end

end
