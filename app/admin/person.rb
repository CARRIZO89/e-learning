ActiveAdmin.register Person do
  belongs_to :user
  permit_params :first_name, :last_name, :dni, :province_id

end
