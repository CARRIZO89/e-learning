class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_around_action :set_locale_from_url

  protected
  
  def current_person
    current_user.person
  end

  def devise_parameter_sanitizer
    Users::ParameterSanitizer.new(User, :user, params)
  end
end
