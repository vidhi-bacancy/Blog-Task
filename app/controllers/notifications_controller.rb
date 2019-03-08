class NotificationsController < ApplicationController
  def index
  	@notifications = Notification.where(user: current_user)
  end

  def change
  	@notification = Notification.find(params[:id])
  	if @notification.update(read: :true)
  		redirect_to blogs_path
  	else
  		redirect_to blogs_path
  	end
  end
end
