module UserHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    session[:user_id] != nil
  end

  def authenticate!
    redirect '/login' unless logged_in?
  end

  def authorized?
    (@user.id == current_user.id)
  end

  def org_admin?
    current_user.id == @organization.try(:representative).try(:id)
  end

end
