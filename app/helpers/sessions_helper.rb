module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    # register a sessions
    session[:user_id] = user.id
  end

  # returns true if the user is logged, otherwise false
  def logged_in?
    !current_user.nil?
  end

  # return current user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # logout 2 jobs
  # delete session  and  delete current_user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
