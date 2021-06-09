class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit
  
  end

  def update
  
  end

  def destroy
  
  end

  private

  def post_params
    params.require(:post).permit(:title, :position, :store_name, :story)
  end

end
