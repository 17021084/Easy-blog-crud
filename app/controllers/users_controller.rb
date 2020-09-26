class UsersController < ApplicationController
  def show
    @user =User.find(params[:id])
   
    # debugger #return nill va co the debug luon o day , debug truc tieo
  end
  
  def new
    # debugger
  end

end
