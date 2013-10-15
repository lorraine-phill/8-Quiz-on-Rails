class AttemptsController < ApplicationController
  def new
    @quiz = Quiz.find params[:quiz_id]
  end

  def create
    @quiz = Quiz.find params[:quiz_id]
    scorer = Scorer.new(@quiz)
    render text: "#100/{scorer.total(params[:answer_ids].values)}%"
  end

def show
  end

end
