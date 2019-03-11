class Notification < ApplicationRecord
  resourcify
  belongs_to :user, optional: true
  belongs_to :blog, optional: true
  belongs_to :notifiable, polymorphic: true
end
