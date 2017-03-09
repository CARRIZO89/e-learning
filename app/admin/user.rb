ActiveAdmin.register User do
  # belongs_to :person
  permit_params :email, :password, :password_confirmation, :role_id,
    person_attributes: [:first_name, :last_name, :dni, :province_id]

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
      f.inputs do
        f.has_many :person, allow_destroy: true, new_record: true do |a|
          a.input :first_name
          a.input :last_name
          a.input :dni
          a.input :province_id, as: :select, collection: Province.all
        end
      end
    end
    f.actions
  end
end
