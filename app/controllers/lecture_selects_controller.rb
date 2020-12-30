class LectureSelectsController < ApplicationController
  def search
    @lecture = Lecture.search(params[:search])
  end

  def show
    @lecture = Lecture.find(params[:id])
    @lecture_detail = LectureDetail.where(lecture_id: params[:id])
  end

end
