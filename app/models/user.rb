class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :blogs, dependent: :destroy
  has_many :notifications ,as: :notifiable, dependent: :destroy
  has_one_attached :avatar

  validates :username, presence: true
  
  after_create :add_method

  def add_method
    self.add_role(:blogger)
  end
end