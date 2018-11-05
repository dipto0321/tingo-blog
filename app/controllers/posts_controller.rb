class PostsController < ApplicationController
  before_action :find_post, only: %i[show update edit destroy]
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:success] = 'Great! Your post has been created!'
      redirect_to @post
    else
      flash.now[:error] = 'Rats! Fix your mistakes, please.'
      redirect_to 'new'
    end
  end

  def show
    # do code
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      redirect_to 'edit'
    end
  end

  def edit
    # do code
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :tags, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
