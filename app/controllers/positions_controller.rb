class WorkSchedules::PositionsController < ApplicationController
  def update
    schedule = WorkSchedule.find(params[:id])
    schedule.insert_at(params[:position].to_i)
  end
end