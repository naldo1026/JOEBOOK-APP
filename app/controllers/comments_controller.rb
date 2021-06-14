class CommentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post = @post

    @comment.user = current_user

    if @comment.save!
      redirect_to post_path(@post)
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
end
