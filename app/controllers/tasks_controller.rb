class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :check_ten_todo, only: [:create]
  before_action :set_task, only: [:update]
  before_action :set_user, only: %i(index)
  
  def index
    @user = params[:user_id].present? ? @user : current_user
    @tasks = @user.tasks.todo.order(updated_at: :desc).page(params[:page])
  end
  
  def new
    @task = current_user.tasks.build
  end 
  
  def show
    @user = current_user
    @tasks = Task.find(params[:id])
  end
  
  def edit
  end

  def endshow_index
    @tasks = current_user.tasks.done.order(updated_at: :desc).page(params[:page])
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to task_chat_rooms_path(@task)
      @status = true
    else
      render :new
      @status = false
    end
  end

   def update
     if @task.complete
       redirect_to tasks_path
     else
       render :index
     end
   end

  # DELETEs/1
  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    redirect_to user_path(current_user), notice: '削除されました'
  end

  private

  def task_params
    params.require(:task).permit(:user_id, :name)
  end
  
  def set_task
    @task = current_user.tasks.find(params[:id])
  end
  
  def check_ten_todo
    redirect_to root_path, notice: 'やりたい事は10個以上を登録できません。全行程終了してから再度お試しください。' if current_user.tasks.todo.size == 10
  end

  def set_user
    @user = User.find(params[:user_id]) if params[:user_id].present?
  end
  
end