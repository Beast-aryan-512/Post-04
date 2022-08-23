class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def approve
    @blog = Blog.find(params[:id])
    approve = true
    @blog.update(approve: approve)
    redirect_to blogs_path
 end

 def unapprove
  @blog = Blog.find(params[:id])
  approve = false
  @blog.update(approve: approve)
  redirect_to blogs_path
end

def show
  @blog = Blog.find(params[:id])
  @comments = Comment.all.where(blog_id: @blog.id)
end

def new
  @blog = Blog.new
end

def create
  @blog = Blog.new(blog_params)

  if @blog.save
    redirect_to @blog
  else
    render 'new'
  end
end

def edit
  @blog = Blog.find(params[:id])
end

def update
  @blog= Blog.find(params[:id])

  if @blog.update(blog_params)
    redirect_to @blog
  else
    render 'edit'
  end
end

def destroy
  @blog = Blog.find(params[:id])
  @blog.destroy

  if @blog.destroy
    redirect_to @blog, notice: "Blog deleted."
  end

end

private

def blog_params
  params.require(:blog).permit(:id, :name, :description, :user_id)
end
end
