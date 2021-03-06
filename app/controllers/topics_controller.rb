class TopicsController < ApplicationController
	
  # GET /topics
  def index
    if params[:tag]
      @topics = Topic.tagged_with(params[:tag])
    else
      @topics = Topic.all
    end

    respond_to do |format|
      format.html
    end
  end

  # GET /topics/1
  def show
    begin
      @topic = Topic.where(id: params[:id]).includes(:comments)
      @forum = @topic.first.forum
    rescue ActiveRecord::RecordNotFound
      Rails.logger.warn { "Not found" }
      nil
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /topics/new
  def new
    @topic = Topic.new
    respond_to do |format|
      format.html
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
  end

  # Topic /topics
  def create
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /topics/1
  def update
    begin
      @topic = Topic.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      Rails.logger.warn { "Not found" }
      nil
    end

    respond_to do |format|
      if @topic.update_attributes(topic_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /topics/1
  def destroy
    begin
      @topic = Topic.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      Rails.logger.warn { "Not found" }
      nil
    end
    
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url }
      format.js
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :forum_id, :tag_list)
  end
end
