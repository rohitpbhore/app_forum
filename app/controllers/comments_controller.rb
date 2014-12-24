class CommentsController < ApplicationController
	def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.create(comment_params)
    respond_to do |format|
      format.html { redirect_to topic_path(@topic) }
      format.js
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to topic_path(@topic) }
      format.js
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :topic_id)
  end
end
