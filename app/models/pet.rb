class Pet < ActiveRecord::Base
  belongs_to :owner
  belongs_to :animal
  has_many :watches
  mount_uploader :image, ImageUploader
end
