class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
  def current_person
    current_user.person
  end
end
