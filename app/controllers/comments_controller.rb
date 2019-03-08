class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@blog = Blog.find(params[:blog_id])
		@comment = @blog.comments.create(comment_params.merge(:user_id => current_user.id))
		# render json: Notification.new(:user_id => current_user.id, :blog => @blog, :notifiable => @comment)
		# return
		#create notification
		@default = false
		if @blog.user != current_user
			Notification.create(:user => @blog.user, :blog => @blog, :notifiable => @comment, :read => @default)
		end
		redirect_to blog_path(@blog)
	end

	
	private
	def comment_params
		params.require(:comment).permit(:body)
	end
end
