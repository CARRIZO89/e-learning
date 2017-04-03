ActiveAdmin.register User do
  action_item :edit,  only: [ :edit ] do
    link_to "#{I18n.t('active_admin.edit_person')}", edit_admin_person_path(id: user.person.id)
  end
  permit_params :email, :password, :password_confirmation, :role_id

filter :id
filter :created_at
filter :updated_at
filter :role_id
filter :person_id

  index do
    column :id
    column :email
    column :last_sign_in_at
    column :created_at
    column :updated_at
    column :role_id
    column :person_id
    actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role_id, as: :select, collection: Role.all
    end
    f.actions
  end
end
