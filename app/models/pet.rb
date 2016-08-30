class Pet < ActiveRecord::Base

  attr_accessible :name, :image, :remote_image_url
  belongs_to :animal
  belongs_to :owner
  has_many :watches
  mount_uploader :image, ImageUploader
end
