#encoding: UTF-8
class QuestionsController < ApplicationController
before_filter :authenticate_user!, :only => [:new, :create, :destroy]
before_filter :is_owner, :only => [:edit]
  # GET /questions
  # GET /questions.json
  def index
    if params[:tag]
      @questions = Question.tagged_with(params[:tag])
    else
      @questions = Question.search(params[:search])
    end

    respond_to do |format|
      format.html # my_questions.html.erb
      format.json { render json: @questions }
    end
  end

  def up
    @question = Question.find(params[:id])
    v = Votequestion.where(:question_id => @question.id, :user_id => current_user)    

    if v.length > 0
      nuevo = v[0]
      case nuevo.vote.to_i
      when -1
        valor = 0
      when 0
        valor = 1
      when 1
        redirect_to question_path(@question.id), notice: 'Solo puede votar 1 vez.'
        return
      end
    else
      nuevo = Votequestion.new(:user_id => current_user.id, :question_id => @question.id, :vote => 1)
      valor = 1
      if not nuevo.save
        redirect_to question_path(@question.id), notice: 'Error intente más tarde.'
      end
    end

    user = User.find(@question.user_id)
    score = @question.score + 1
    uscore = user.score + 1
    if @question.update_attribute('score', score) and user.update_attribute('score', uscore) and nuevo.update_attribute('vote',valor)
      
      redirect_to @question, notice: 'Voto actualizado.'
    else
      redirect_to @question, notice: 'Error intente más tarde.'
    end
  end


  def down
    @question = Question.find(params[:id])
    v = Votequestion.where(:question_id => @question.id, :user_id => current_user)

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
      nuevo = Votequestion.new(:user_id => current_user.id, :question_id => @question.id, :vote => -1)
      valor = -1
      if not nuevo.save
        redirect_to question_path(@question.id), notice: 'Error intente más tarde.'
      end
    end

    user = User.find(@question.user_id)
    score = @question.score - 1
    uscore = user.score - 1
    if @question.update_attribute('score', score) and user.update_attribute('score', uscore) and nuevo.update_attribute('vote',valor)      
      redirect_to @question, notice: 'Voto actualizado.'
    else
      redirect_to @question, notice: 'Error intente más tarde.'
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])
    #authorize! :read, @question

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new
    authorize! :create, @question

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
    authorize! :update, @question
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(params[:question])
    @question.user = current_user
    @question.score = 0
    
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Pregunta creada correctamente.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Pregunta editada correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    authorize! :destroy, @question
    @question.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end