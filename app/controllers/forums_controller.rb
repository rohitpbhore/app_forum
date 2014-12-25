class ForumsController < ApplicationController
	
  # GET /forums
  def index
    @forums = Forum.all

    respond_to do |format|
      format.html
    end
  end

  # GET /forums/1
  def show
    begin
      @forum = Forum.where(id: params[:id]).includes(:topics)
    rescue ActiveRecord::RecordNotFound
      Rails.logger.warn { "Not found" }
      nil
    end

    respond_to do |format|
      format.html
    end
  end

  # GET /forums/new
  def new
    @forum = Forum.new
    respond_to do |format|
      format.html
    end
  end

  # GET /forums/1/edit
  def edit
    begin
      @forum = Forum.find(params[:id])  
    rescue ActiveRecord::RecordNotFound
      Rails.logger.warn { "Not found" }
      nil
    end
  end

  # forum /forums
  def create
    @forum = Forum.new(forum_params)

    respond_to do |format|
      if @forum.save
        format.html { redirect_to @forum, notice: 'Forum was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /forums/1
  def update
    begin
      @forum = Forum.find(params[:id])  
    rescue ActiveRecord::RecordNotFound
      Rails.logger.warn { "Not found" }
      nil
    end

    respond_to do |format|
      if @forum.update_attributes(forum_params)
        format.html { redirect_to @forum, notice: 'forum was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /forums/1
  def destroy
    begin
      @forum = Forum.find(params[:id])  
    rescue ActiveRecord::RecordNotFound
      Rails.logger.warn { "Not found" }
      nil
    end

    @forum.destroy
    respond_to do |format|
      format.html { redirect_to forums_url }
      format.js
    end
  end

  private

  def forum_params
    params.require(:forum).permit(:name)
  end
end
