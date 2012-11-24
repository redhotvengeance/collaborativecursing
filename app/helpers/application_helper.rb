module ApplicationHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_nav_item(name)
    "on" if @filter == name
  end
end
