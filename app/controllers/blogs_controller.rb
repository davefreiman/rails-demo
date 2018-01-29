class BlogsController < ApplicationController
  before_action :find_blog, only: %i(show edit update destroy)

  def index
    @blogs = Blog.all
  end

  def show; end

  def new
    @blog = Blog.new
  end

  def edit; end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to blog_path(@blog)
    else
      render :new
    end
  end

  def update
    if @blog.update_attributes(blog_params)
      redirect_to blog_path(@blog)
    else
      render :edit
    end
  end

  def destroy
    if @blog.destroy!
      redirect_to blogs_path
    else
      redirect_to blog_path(@blog)
    end
  end

  private

  def find_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.permit(:title, :content)
  end
end
