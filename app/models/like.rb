class Like < ApplicationRecord
  resourcify
  belongs_to :user, optional: true
  belongs_to :blog, optional: true
  has_many :notifications,as: :notifiable, dependent: :destroy

end
