class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  skip_around_action :set_locale_from_url
  rescue_from Pundit::NotAuthorizedError do |e|
    flash[:kind]   = 'warning'
    flash[:header] = t('not_authorized_header')
    flash[:body]   = t('not_authorized_body', name: e.record.display_name)
    redirect_to :back
  end

  helper_method :current_person

  protected

  def current_person
    current_user.person
  end

  def devise_parameter_sanitizer
    Users::ParameterSanitizer.new(User, :user, params)
  end
end
