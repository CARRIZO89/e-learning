ActiveAdmin.register Role do
  permit_params :name

  filter :users
  filter :name
  
end
