class BlogsController < ApplicationController
	before_action :authenticate_user!, except: [:index , :show]
	load_and_authorize_resource
	def new
		@blog = Blog.new
	end

	def create
		@blog = Blog.new(blog_params.merge(:user_id=>current_user.id))
		if @blog.save
			redirect_to blogs_path
		else
			render 'new'
		end
	end

	def index
		@blog = Blog.all
	end

	def edit
		@blog = Blog.find(params[:id])
	end

	def update
		@blog = Blog.find(params[:id])
  		if @blog.update(blog_params.merge(:user_id=>current_user.id))
    		redirect_to blogs_path
  		else
    		render 'edit'
  		end
	end

	def show
		@blog = Blog.find(params[:id])
	end

	def destroy
		@blog = Blog.find(params[:id])
		@blog.destroy
		redirect_to blogs_path
	end

	private
	def blog_params
		params.require(:blog).permit(:title, :body)
	end
end