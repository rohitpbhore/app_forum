class CommentsController < ApplicationController
	
  # Comments /comments
  def create
    begin
      @topic = Topic.find(params[:topic_id])
    rescue ActiveRecord::RecordNotFound
      Rails.logger.warn { "Not found" }
      nil
    end

    @comment = @topic.comments.create(comment_params)
    respond_to do |format|
      format.html { redirect_to topic_path(@topic) }
      format.js
    end
  end

  # DELETE /comments/1
  def destroy
    begin
      @topic = Topic.find(params[:topic_id])
      @comment = @topic.comments.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      Rails.logger.warn { "Not found" }
      nil
    end
    
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to topic_path(@topic) }
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :topic_id)
  end
end
