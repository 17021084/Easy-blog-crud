class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[edit update index destroy]
  before_action :correct_user, only: %i[edit update]
  before_action :admin_user, only: :destroy

  def index
    # default per_page is 30
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  # show the specific id
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
      flash[:success] = 'welcome to  the sample app'
      # redirect_to @user # cach viet ngan cua cai duoi

      # automatically login via add sesssion
      log_in @user
      redirect_to user_path @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Update success '
      redirect_to user_path @user
    else
      render 'edit'
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to users_url
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # Before filters
  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end
end
