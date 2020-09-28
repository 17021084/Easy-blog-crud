class SessionsController < ApplicationController
  def new; end

  def create
    p params

    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
        redirect_to user_path user
    else
      render 'new'
    end
  end

  def destroy; end
end
