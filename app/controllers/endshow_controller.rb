class EndshowController < ApplicationController
    before_action :authenticate_user!
    PER = 5

    def index      
      @tasks = Task.done.page(params[:page]).per(PER)
    end
end