class SchedulesController < ApplicationController

  def new
    @schedules_new = Schedule.new
  end

  def create
    @schedules_new = Schedule.new(schedules_params)
    if @schedules_new.save
       redirect_to root_path
    else
      render 'subjects/index'
    end
  end

  private

  def schedules_params
    params.permit(:start_time, :title, :text, :area, :time).merge(user_id: current_user.id)
  end

end
