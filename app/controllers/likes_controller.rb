class LikesController < ApplicationController
	before_action :authenticate_user!
	def create
		@blog = Blog.find(params[:blog_id])
		c = like_exist?
		if c == false
			@like = @blog.likes.create(:user_id => current_user.id)
			@default = false
			Notification.create(:user => @blog.user, :blog => @blog, :notifiable => @like, :read => @default)
		else
			flash[:notice]="Already Liked"
		end
		redirect_to blog_path(@blog)
	end

	private
	def like_exist?
		Like.where("user_id = ? and blog_id = ?",current_user,params[:blog_id]).exists?
	end
end