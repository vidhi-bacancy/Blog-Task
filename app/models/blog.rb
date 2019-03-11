class Blog < ApplicationRecord
	resourcify
	belongs_to :user
	has_many :comments, dependent: :destroy
	  has_many :notifications,as: :notifiable, dependent: :destroy

	has_many :likes, dependent: :destroy
end