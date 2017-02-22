class Users::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [ person_attributes: [ :first_name, :last_name, :province_id]])
  end
end