class Device < ApplicationRecord
  mount_uploaders :images, DeviceImageUploader
  belongs_to :user
  validates :name, presence: true
  validates :images, presence: true
  validates :description, presence: true
  # validates :availability, presence: true
end
