class ApplicationController < ActionController::Base
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render text: exception, status: 500
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, alert: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
  
  rescue_from ActiveRecord::InvalidForeignKey do |_|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_back fallback_location: main_app.root_url, alert: 'This object is associated with another object' }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
end
