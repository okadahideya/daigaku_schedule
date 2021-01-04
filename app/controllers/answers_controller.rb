class AnswersController < ApplicationController

  def new
    @answer_new = Answer.new
    @question = Question.find(params[:id])
  end

  def create
    @answer_new = Answer.new(answer_params)
    if @answer_new.save
      redirect_to  lecture_lecture_detail_question_path(id: @answer_new.question_id)
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    @answer = Answer.find(params[:question_id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.update(answer_params_up)
    redirect_to lecture_lecture_detail_question_path(@question, @question.lecture_detail_id, @answer.question_id)
  end

  def destroy
    @answer = Answer.find(params[:question_id])
    @answer.destroy
    redirect_to lecture_lecture_detail_question_path(@answer, @answer.question_id)
  end

  private

  def answer_params
      params.permit(:answer_text).merge(professor_id: current_professor.id, question_id: params[:question_id])
  end

  def answer_params_up
    params.require(:answer).permit(:answer_text).merge(professor_id: current_professor.id, question_id: params[:question_id])
  end

end
