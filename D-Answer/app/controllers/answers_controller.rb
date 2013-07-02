#encoding: UTF-8
class AnswersController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :destroy]
  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @answers }
    end
  end

  def up
    @question = Question.find(params[:id])
    @answer = @question.answers.find(params[:answer])
    v = Voteanswer.where(:user_id => current_user, :answer_id => @answer.id)

    if v.length > 0
      nuevo = v[0]
      case nuevo.vote.to_i
      when -1
        valor = 0
      when 0
        valor = 1
      when 1
        redirect_to question_path(@question.id), notice: 'Sólo puede votar 1 vez.'
        return
      end
    else
      nuevo = Voteanswer.new(:user_id => current_user.id, :answer_id => @answer.id, :vote => 1)
      valor = 1
      if not nuevo.save
        redirect_to question_path(@question.id), notice: 'Error intente más tarde.'
      end
    end

    user = User.find(@answer.user_id)
    score = @answer.score + 1
    uscore = user.score + 1
    if @answer.update_attribute('score', score) and user.update_attribute('score', uscore) and nuevo.update_attribute('vote',valor)      
      redirect_to @question, notice: 'Voto actualizado.'
    else
      redirect_to @question, notice: 'Error intente más tarde.'
    end
  end

  def down
    @question = Question.find(params[:id])
    @answer = @question.answers.find(params[:answer])
    v = Voteanswer.where(:user_id => current_user, :answer_id => @answer.id)

    if v.length > 0
      nuevo = v[0]
      case nuevo.vote.to_i
      when 1
        valor = 0
      when 0
        valor = -1
      when -1
        redirect_to question_path(@question.id), notice: 'Sólo puede votar 1 vez.'
        return
      end
    else
      nuevo = Voteanswer.new(:user_id => current_user.id, :answer_id => @answer.id, :vote => -1)
      valor = -1
      if not nuevo.save
        redirect_to question_path(@question.id), notice: 'Error intente más tarde.'
      end
    end

    user = User.find(@answer.user_id)
    score = @answer.score - 1
    uscore = user.score - 1
    if @answer.update_attribute('score', score) and user.update_attribute('score', uscore) and nuevo.update_attribute('vote',valor)      
      redirect_to @question, notice: 'Voto actualizado.'
    else
      redirect_to @question, notice: 'Error intente más tarde.'
    end
  end

  def favorite
    @question = Question.find(params[:id])
    @answer = @question.answers.find(params[:answer])
    @old = @question.answers.where( :fav => 1 )

    if @old[0]
      @old[0].fav = 0
      # @user = User.find(@old[0].user_id)
      # @user.score -= 10
      # @user.save
      # @old[0].score -= 1
      @old[0].save
    end

    @answer.fav = 1
    # @answer.score += 1
    # @user = User.find(@answer.user_id)
    # @user.score += 10
    # @user.save
    
    respond_to do |format|
      if @answer.save
        format.html { redirect_to @question, notice: 'Respuesta actualizada.' }
        format.json { render json: @question }
      end
    end
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    @answer = Answer.find(params[:id])
    authorize! :read, @answer

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @answer }
    end
  end

  # GET /answers/new
  # GET /answers/new.json
  def new
    @answer = Answer.new
    authorize! :create, @answer

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @answer }
    end
  end

  # GET /answers/1/edit
  def edit
    @answer = Answer.find(params[:id])
    authorize! :update, @answer
  end

  # POST /answers
  # POST /answers.json
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(params[:answer])
    @answer.user = current_user
    @answer.score = 0
    @answer.fav = 0
    @user = User.find(@question.user_id)

    respond_to do |format|
      if @answer.save
        UserMailer.answer_email(@user).deliver
        format.html { redirect_to @question, notice: 'Respuesta creada correctamente.' }
        format.json { render json: @question, status: :created, location: @answer }
      else
        format.html { render action: "new" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /answers/1
  # PUT /answers/1.json
  def update
    @answer = Answer.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to @answer, notice: 'Respuesta actualizada correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    authorize! :destroy, @answer
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to @question }
      format.json { head :no_content }
    end
  end
end
