class QuestionsController < ApplicationController

  def index
    @lecture_detail = LectureDetail.find(params[:lecture_detail_id])
    @question = Question.where(lecture_detail_id: params[:lecture_detail_id])
  end

  def new
    @lecture_detail = LectureDetail.find(params[:id])
    @question_new = Question.new
  end

  def create
    @question_new = Question.new(question_params)
    if @question_new.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private

  def question_params
    params.permit(:question_text).merge(user_id: current_user.id, lecture_detail_id: params[:lecture_detail_id])
  end
end
