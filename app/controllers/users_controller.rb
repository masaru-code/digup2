class UsersController < ApplicationController
 before_action :authenticate_user!

  def index
    @users = params[:name].present? ? User.where('name LIKE ?', "%#{params[:name]}%") : User.none
  end
  
  def show
    @user = User.find(params[:id])
  end

  
end


