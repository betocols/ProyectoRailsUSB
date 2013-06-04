class HomeController < ApplicationController
  def index
      @questions = Question.all
      if user_signed_in?
        render :template => 'questions/index'
      end
  end
end
