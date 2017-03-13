ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :role_id,
    person_attributes: [:first_name, :last_name, :dni, :province_id, :type]

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
      f.semantic_fields_for :person, (f.object.person || f.object.build_person) do |a|
        a.input :first_name
        a.input :last_name
        a.input :dni
        a.input :province_id, as: :select, collection: Province.all
        a.input :type, as: :select, collection: [Student, Teacher]
      end
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role_id, as: :select, collection: Role.all
    end
    f.actions
  end
end
