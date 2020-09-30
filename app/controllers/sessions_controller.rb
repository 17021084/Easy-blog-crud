class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && authenticate(params[:session][:password])
      flash[:success] = 'Log in successfully'
      log_in user  # save session for users
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user_path user
    else
      flash[:danger] = ' invalid email or password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
