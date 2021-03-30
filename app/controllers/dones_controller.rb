class DonesController < ApplicationController
before_action :set_task, only: %i(update)

  def show
      @user = User.find(params[:user_id])
  end

  def update
    @task.done!
    redirect_to endshow_index_path
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end
end
