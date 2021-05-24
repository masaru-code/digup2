class DigHomeController < ApplicationController
before_action :authenticate_user!
#before_action :logged_in_user, only: [:jikou, :jikou_end, :chat_room, :minnna, :proces]deviseで自動生成
PER = 5
  
  def dighome
    @alluser = User.all
    @alltask = Task.order(created_at: :desc).limit(30)
  end

  def dig_index
    @users = User.order(created_at: :asc).page(params[:page]).per(PER)
  end
  
  def show
  end
  
  def chat_room
     @task = current_user.tasks(name)
  end
  
private
  def user_search_params
    params.fetch(:search, {}).permit(:name)
  end

end
