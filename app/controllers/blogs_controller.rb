class BlogsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @blogs = Blog.all.order("created_at DESC").page(params[:page]).per(8)
  
  end

  def new
    
  end

  def create
    Blog.create(text: blog_params[:text])
    
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(text: params[:text])
    redirect_to("/")
    
  end
 

  private
  def blog_params
    params.permit(:text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end