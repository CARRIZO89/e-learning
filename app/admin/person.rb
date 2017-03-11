ActiveAdmin.register Person do
  belongs_to :user
  
  config.action_items.delete_if { |item| item.display_on?(:show) }

  action_item :edit,  only: [ :show ] do
    link_to "#{I18n.t('active_admin.edit')}", edit_admin_user_path(id: params[:user_id])
  end

  permit_params :first_name, :last_name, :dni, :province_id

  index do
    column :id
    column :first_name
    column :last_name
    column :dni
    column :user_id
    actions
  end

  controller do
    def show
      user = User.where(id: params[:user_id]).first
      if user
        @person = user.person
      end
    end
  end

  # form do |f|
  #   f.inputs do
  #     f.input :first_name
  #     f.input :last_name
  #     f.input :dni
  #     f.input :province_id, as: :select, collection: Province.all
  #     f.input :type, as: :select, collection: [Student, Teacher]
  #     f.semantic_fields_for :user, (f.object.user || f.object.build_user) do |a|
  #       a.input :email
  #       a.input :password
  #       a.input :password_confirmation
  #       a.input :role_id, as: :select, collection: Role.all
  #     end
  #   end
  #   f.actions
  # end
end
