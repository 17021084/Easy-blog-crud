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

  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    # set cookies. key is userId value remember_token
    cookies.permanent.signed[:user_id] = user.id 
    cookies.permanent[:remember_token] = user.remember_token
  end

  # return current user
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: session[:user_id])
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user&.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # Forgets a persistent session. 
  def forget user
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # logout 3 jobs : delete session ,  delete current_user, delete token
  def log_out
    session.delete(:user_id)
    forget(current_user)
    @current_user = nil
  end
end
