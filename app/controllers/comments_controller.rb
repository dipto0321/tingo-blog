class CommentsController < ApplicationController
  before_action :find_comment, only: %i[show update edit destroy]

  def show
    # do code
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def edit
    # do code
  end

  # def update
    
  # end

  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end


  private

  def comment_params
    params.require(:comment).permit(:name, :comment)
  end

  def find_comment
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end
end
