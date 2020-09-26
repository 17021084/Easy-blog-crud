class UsersController < ApplicationController
 
  #show the specific id
  def show
    @user = User.find(params[:id])
    # debugger #return nill va co the debug luon o day , debug truc tieo
  end

  # Render view
  def new
    @user = User.new
  end

  # handler Summit
  def create
    @user = User.new(user_params)
    # @user = User.new(params[:user]) # permitted false neen loi authen ....
    # debugger
    if @user.save
    # Handle a successful save.
    render 'new'
    else
      render 'new'
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
