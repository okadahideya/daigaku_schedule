class QuestionsController < ApplicationController

  def index
    @lecture_detail = LectureDetail.find(params[:lecture_detail_id])
    @question = Question.where(lecture_detail_id: params[:lecture_detail_id]).order(created_at: :desc)
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

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @lecture_detail = LectureDetail.find(params[:id])
    @question = Question.find(params[:id])
    if @question.update(question_params_up)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.where(question_id: @question.id)
    #@answers = Answer.where(question_id: params[:id]).pluck(:answer_text)
    #@answer_t = Answer.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to lecture_detail_questions_path(@question.lecture_detail_id)
  end

  private

  def question_params
    params.permit(:question_text).merge(user_id: current_user.id, lecture_detail_id: params[:lecture_detail_id])
  end

  def question_params_up
    params.require(:question).permit(:question_text).merge(user_id: current_user.id, lecture_detail_id: params[:lecture_detail_id])
  end
end
