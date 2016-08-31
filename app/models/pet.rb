class Pet < ActiveRecord::Base

  # attr_accessible :name, :image, :remote_image_url
  belongs_to :animal
  belongs_to :owner
  has_many :watches
  validates :name, :age, :animal_id, :presence => true
  # mount_uploader :image, ImageUploader
end
