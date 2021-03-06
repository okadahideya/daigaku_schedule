class SubjectsController < ApplicationController
  before_action :search_product, only: [:show, :search, :edit]

  def index
    @schedules = Schedule.where(user_id: current_user.id).order(start_time: :asc)
  end

  def new
    @user = current_user
    @subject = Subject.new
    @subject_details = @subject.subject_details.build
    @subject_details = @subject.subject_details.build
    @subject_details = @subject.subject_details.build
  end

  def create
    @user = current_user
    @subject = Subject.new(subject_params)
   if @subject.save
     redirect_to subjects_path
   else
     render :new
   end
  end

  def show
    @subject_details = SubjectDetail.where(user_id: params[:id])
    @unit_sum = SubjectDetail.where(user_id: params[:id]).sum(:unit)
  end 

  def search
    @results = @p.result.where(user_id: current_user.id).includes(:subject) 
    @results_unit = @results.sum(:unit)
  end

  def edit
    @subject = Subject.where(user_id: params[:id]).includes(:subject_detail) 
  end

  def update
    
  end

  private

  def subject_params
    params.require(:subject).permit(:grade_genre_id, :period_genre_id, 
    subject_details_attributes: [:id, :user_id, :curriculum, :unit, :result_genre_id, :select_genre_id, :time_genre_id, :week_genre_id, :_destroy]).merge(user_id: current_user.id)
  end

  def search_product
    @p = SubjectDetail.ransack(params[:q])
  end

end
