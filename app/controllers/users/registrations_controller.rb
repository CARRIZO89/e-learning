class Users::RegistrationsController < Devise::RegistrationsController

  # POST /resource
  def create
    super do |resource|
      resource.person.type = "Student"
      resource.role = Role.student
      resource.save
    end
  end

  def after_update_path_for(resource)
    case resource
    when :user, User
      edit_user_registration_path
    else
      super
    end
  end
end
