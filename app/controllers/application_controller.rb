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
  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordInvalid do |e|
    flash[:kind]   = 'error'
    flash[:header] = t('failure')
    flash[:body]   = t('.failure', errors: e.record.errors.messages.values.flatten.join('<br>'))
    redirect_back(fallback_location: '')
  end

  helper_method :current_person

  protected

  def current_person
    current_user.person
  end

  private
  def configure_permitted_parameters
    person_attr = [:first_name, :last_name, :dni, :province_id]
    user_attr = [:email, :password, :password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: [user_attr,
                                      person_attributes: [person_attr]])
    devise_parameter_sanitizer.permit(:account_update, keys: [:current_password, user_attr,
                                      person_attributes: [:id, person_attr]])
  end
end
