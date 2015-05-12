module ApplicationHelper

  def active_link(current_link)
    :active if params[:controller] == current_link
  end
end
