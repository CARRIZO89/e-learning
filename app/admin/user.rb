ActiveAdmin.register User do
  action_item :edit,  only: [ :edit ] do
    link_to "#{I18n.t('active_admin.edit_person')}", edit_admin_person_path(id: user.person.id)
  end
  permit_params :email, :password, :password_confirmation, :role_id,
                person_attributes: [:id, :first_name, :last_name, :province_id, :dni, :type]

filter :id
filter :created_at
filter :updated_at
filter :role
filter :person_id

  index do
    column :id
    column :email
    column :last_sign_in_at
    column :created_at
    column :updated_at
    column :role
    column :person
    actions
  end

  form do |f|
    f.inputs I18n.t('activerecord.models.person') do
      f.semantic_fields_for :person, f.object.person || f.object.build_person do |a|
        a.input :id, as: :hidden
        a.inputs :first_name, :last_name
        a.input :dni, as: :number
        a.input :province
        a.input :type, as: :select, collection: [
          ['Estudiante', 'Student'],
          ['Profesor', 'Teacher']
        ]
      end
    end
    f.inputs I18n.t('activerecord.models.user') do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role_id, as: :select, collection: Role.all
    end
    f.actions
  end
end
