module ApplicationHelper

	def notification_count
		Notification.where(read: false, user: current_user).count if user_signed_in?
		# Notification.where("read=? and user=?",false,current_user).count
	end

	def notification_index
		@notification = Notification.where(user: current_user)
	end
end
