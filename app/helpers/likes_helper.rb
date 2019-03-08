module LikesHelper

	def like_exist?(blog_id)
		Like.where("user_id = ? and blog_id = ?",current_user,blog_id).exists?
	end
end
