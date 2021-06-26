class UsersController < ApplicationController
 before_action :authenticate_user!

  def index
    @users = params[:name].present? ? User.where('name LIKE ?', "%#{params[:name]}%") : User.none
  end
  
  def show
    @user = User.find(params[:id])
  end

  def update
    @user_invitation = User.first.invitation
    @user_invitation = params[:invitation]
    redirect_to dig_home_dig_index_path, notice: "編集されました"
  end

  
end


