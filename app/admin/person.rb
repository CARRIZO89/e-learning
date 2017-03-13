ActiveAdmin.register Person do
  action_item :edit,  only: [ :edit ] do
    link_to "#{I18n.t('active_admin.edit_user')}", edit_admin_user_path(id: person.user.id)
  end
  permit_params :first_name, :last_name, :dni, :province_id, :type

  index do
    column :id
    column :first_name
    column :last_name
    column :dni
    column :user_id
    actions
  end

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :dni
      f.input :province_id, as: :select, collection: Province.all
      f.input :type, as: :select, collection: [Student, Teacher]
    end
    f.actions
  end
end
