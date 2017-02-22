class Users::RegistrationsController < Devise::RegistrationsController

  # POST /resource
  def create
    super do |resource|
      resource.person.type = "Student"
      resource.role = Role.student
      resource.save
    end
  end
end
