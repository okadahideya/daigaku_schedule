class AnswersController < ApplicationController

  def new
    @answer_new = Answer.new
    @question = Question.find(params[:id])
    @lecture = Lecture.find(params[:id])
  end

  def create
    @answer_new = Answer.new(answer_params)
    if @answer_new.save
      redirect_to  lecture_lecture_detail_question_path(id: @answer_new.question_id)
    else
      render :new
    end
  end

  private

  def answer_params
    params.permit(:answer_text).merge(professor_id: current_professor.id, question_id: params[:question_id])
  end
end
