module ApplicationHelper
  def province_options
    Province.pluck(:name, :id)
  end

  def role_options
    Role.pluck(:name, :id)
  end

  def modality_options
    Modality.pluck(:name, :id)
  end
end
