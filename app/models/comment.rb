class Comment < ApplicationRecord
  resourcify
  belongs_to :user, optional: true
  belongs_to :blog, optional: true
  has_many :notifications,as: :notifiable, dependent: :destroy
  def find_name(id)
		User.select("username").where('id = ?', id)
  end

end
