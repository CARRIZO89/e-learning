class Users::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [ person_attributes: [ :first_name, :last_name, :dni, :province_id]])
  end
end