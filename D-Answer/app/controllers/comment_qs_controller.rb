class CommentQsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :destroy] #Para que se requiera estar logueado
  # GET /comment_qs
  # GET /comment_qs.json
  def index
    @comment_qs = CommentQ.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comment_qs }
    end
  end

  # GET /comment_qs/1
  # GET /comment_qs/1.json
  def show
    @comment_q = CommentQ.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment_q }
    end
  end

  # GET /comment_qs/new
  # GET /comment_qs/new.json
  def new
    @comment_q = CommentQ.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment_q }
    end
  end

  # GET /comment_qs/1/edit
  def edit
    @comment_q = CommentQ.find(params[:id])
  end

  # POST /comment_qs
  # POST /comment_qs.json
  def create
    @question = Question.find(params[:question_id])
    @commentq = @question.comment_qs.new(params[:comment_q])
    @commentq.user = current_user

    respond_to do |format|
      if @commentq.save
        format.html { redirect_to @question, notice: 'Comment q was successfully created.' }
        format.json { render json: @question, status: :created, location: @comment_q }
      else
        format.html { render action: "new" }
        format.json { render json: @comment_q.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comment_qs/1
  # PUT /comment_qs/1.json
  def update
    @comment_q = CommentQ.find(params[:id])

    respond_to do |format|
      if @comment_q.update_attributes(params[:comment_q])
        format.html { redirect_to @comment_q, notice: 'Comment q was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment_q.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_qs/1
  # DELETE /comment_qs/1.json
  def destroy
    @question = Question.find(params[:question_id])
    @comment_q = @question.comment_qs.find(params[:id])
    @comment_q.destroy

    respond_to do |format|
      format.html { redirect_to @question }
      format.json { head :no_content }
    end
  end

end
