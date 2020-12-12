class SubjectsController < ApplicationController

  before_action :search_product, only: [:show, :search]

  def index
  end

  def new
    @user = current_user
    if user_signed_in?
      @subject = Subject.new
      @subject_details = @subject.subject_details.build
    else
      render :index
    end
  end

  def create
    @subject = Subject.new(subject_params)
   if @subject.save
     redirect_to root_path
   else
     render :new
   end
  end

  def show
    @subject_details = SubjectDetail.where(user_id: params[:id])
  end 

  def search
    @results = @p.result.where(user_id: current_user.id).includes(:subject) 
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
