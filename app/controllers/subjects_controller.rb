class SubjectsController < ApplicationController
  def index
  end

  def new
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

  private

  def subject_params
    params.require(:subject).permit(:grade_genre_id, :period_genre_id, 
    subject_details_attributes: [:_destroy, :curriculum, :unit, :result_genre_id, :select_genre_id, :time_genre_id, :week_genre_id]).merge(user_id: current_user.id, subject_id: subject.id)
  end

end
