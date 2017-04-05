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

  def flash_error?
    flash[:alert] == 'ERROR'
  end

  def page_title
    content_for(:page_title) || @page_title || I18n.t(controller_name, scope: 'titles')
  end

  def page_subtitle
    content_for(:page_subtitle) || @page_subtitle || I18n.t(action_name)
  end
end
