class SchedulesController < ApplicationController
  before_action :schedules_set, only: [:edit, :update, :destroy]

  def new
    @schedules_new = Schedule.new
  end

  def create
    @schedules_new = Schedule.new(schedules_params)
    if @schedules_new.save
       redirect_to controller: :subjects, action: :index
    else
      render 'subjects/index'
    end
  end

  def edit
  end

  def update
    if @schedules.update(schedules_params_up)
      redirect_to controller: :subjects, action: :index
    else
      render :edit
    end
  end

  def destroy
    @schedules.destroy
    redirect_to controller: :subjects, action: :index
  end

  private

  def schedules_set
    @schedules = Schedule.find(params[:id])
  end

  def schedules_params
    params.permit(:start_time, :title, :text, :area, :time).merge(user_id: current_user.id)
  end

  def schedules_params_up
    params.require(:schedule).permit(:start_time, :title, :text, :area, :time).merge(user_id: current_user.id)
  end


end
