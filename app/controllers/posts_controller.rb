class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
 
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      # re-render the :new template WITHOUT throwing away the invalid @post
      render :new
    end
  end

  def edit
  end

  def update
    

    if @post.update(post_params)

    redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
