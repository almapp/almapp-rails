class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :dump_to_root
  layout :get_layout

  def dump_to_root
    redirect_to root_url(subdomain: '') unless request.subdomain == '' || valid_subdomain?(request.subdomain)
  end

  def current_organization
    current_organization ||= Organization.find_with_subdomain(request.subdomain)
  end

  def current_subdomain
    current_subdomain ||= request.subdomain
  end

  def get_subdomain_for_organization(organization)
    organization.slug.downcase
  end

  def valid_subdomain?(subdomain)
    SUBDOMAINS.include? subdomain.downcase
  end

  helper_method :current_organization, :get_subdomain_for_organization, :current_subdomain

  private
    SUBDOMAINS = Organization.pluck(:slug).map(&:downcase)

    def get_layout
      if current_organization.present?
        resource = current_organization.slug + '_layout'
        resource.to_s.downcase
      else
        'application'
      end
    end

end
