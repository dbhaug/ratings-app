class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  rescue_from CanCan::AccessDenied do |exception|
  	if (signed_in?)
  		render file: "#{Rails.root}/public/403", formats: [:html], status: 403, layout: false
  	else	
    	redirect_to signin_path
    end
  end

  def handle_unverified_request
  	sign_out
  	super
  end
end
