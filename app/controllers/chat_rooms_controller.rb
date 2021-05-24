class ChatRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task
  
  def index
     @comments = @task.comments
     @comment = Comment.new
     #render layout: false
  end
  
  def create
    
    @comment = current_user.comments.build(comment_params.merge(task: @task))
    if @comment.save
     redirect_to task_chat_rooms_path(@task)

    else
      render :index
    end
    
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :image)
  end
end
