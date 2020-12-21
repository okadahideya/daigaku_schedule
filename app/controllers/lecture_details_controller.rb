class LectureDetailsController < ApplicationController
  def index
    @lecture = Lecture.find(params[:lecture_id])
  end

  def new
    
  end
end
