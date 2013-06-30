class MyQuestionsController < ApplicationController
  def index
    @user = current_user.id
    @my_questions = Question.where( :user_id => @user ) 

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @my_questions }
    end
  end
end
