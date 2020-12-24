class LectureDetailsController < ApplicationController

  def index
    @lecture = Lecture.find(params[:lecture_id])
    @lecture_detail = LectureDetail.where(professor_id: current_professor.id, lecture_id: params[:lecture_id])
  end

  def new
    @lecture = Lecture.find(params[:lecture_id])
    @lecture_detail = LectureDetail.new
  end

  def create
    @lecture_detail = LectureDetail.new(lecture_detail_params)
    if @lecture_detail.save
     redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @lecture_detail = LectureDetail.find(params[:id])
  end

  private

  def lecture_detail_params
    params.require(:lecture_detail).permit(:lecture_date, :lecture_title_list, :lecture_text, :lecture_office).merge(professor_id: current_professor.id, lecture_id: params[:lecture_id])
  end

end
