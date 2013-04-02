class CommentsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    @commenter = current_user
    #@commenter = @post.commenter.build(params[:commenter])
    
    redirect_to post_path(@post)
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
  
end
