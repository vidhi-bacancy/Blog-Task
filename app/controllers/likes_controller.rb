class LikesController < ApplicationController
	before_action :authenticate_user!
	def create
		@blog = Blog.find(params[:blog_id])
		c = like_exist?
		if c == false
			@like = @blog.likes.create(:user_id => current_user.id)
			@default = false
			if @blog.user != current_user
				Notification.create(:user => @blog.user, :blog => @blog, :notifiable => @like, :read => @default)
			end
			flash[:notice] = "Liked Successfully"
		else
			flash[:notice] = "already like"	
		end
		redirect_to blog_path(@blog)
	end
	def destroy
		@like = Like.where(user: current_user, blog_id: params[:blog_id]).take
		if @like
			@like.destroy
			flash[:notice] = 'Unliked Successfully'
		end	
		redirect_to blog_path(params[:blog_id])
	end
	private
	def like_exist?
		Like.where("user_id = ? and blog_id = ?",current_user,params[:blog_id]).exists?
	end
end