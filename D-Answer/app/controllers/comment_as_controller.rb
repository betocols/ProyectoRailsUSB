class CommentAsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :destroy]
  # GET /comment_as
  # GET /comment_as.json
  def index
    @comment_as = CommentA.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comment_as }
    end
  end

  # GET /comment_as/1
  # GET /comment_as/1.json
  def show
    @comment_a = CommentA.find(params[:id])
    authorize! :read, @comment_a

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment_a }
    end
  end

  # GET /comment_as/new
  # GET /comment_as/new.json
  def new
    @comment_a = CommentA.new
    authorize! :create, @comment_a

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment_a }
    end
  end

  # GET /comment_as/1/edit
  def edit
    @comment_a = CommentA.find(params[:id])
    authorize! :update, @comment_a
  end

  # POST /comment_as
  # POST /comment_as.json
  def create
    @comment_a = CommentA.new(params[:comment_a])

    respond_to do |format|
      if @comment_a.save
        format.html { redirect_to @comment_a, notice: 'Comment a was successfully created.' }
        format.json { render json: @comment_a, status: :created, location: @comment_a }
      else
        format.html { render action: "new" }
        format.json { render json: @comment_a.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comment_as/1
  # PUT /comment_as/1.json
  def update
    @comment_a = CommentA.find(params[:id])
    
    respond_to do |format|
      if @comment_a.update_attributes(params[:comment_a])
        format.html { redirect_to @comment_a, notice: 'Comment a was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment_a.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_as/1
  # DELETE /comment_as/1.json
  def destroy
    @comment_a = CommentA.find(params[:id])
    authorize! :destroy, @comment_a
    @comment_a.destroy

    respond_to do |format|
      format.html { redirect_to comment_as_url }
      format.json { head :no_content }
    end
  end
end
