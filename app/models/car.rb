class Car < ApplicationRecord
  belongs_to :carmaker, optional: true
  has_many :users
  has_many :posts
  mount_uploader :image, ImageUploader

  def thumbnail
    return self.image.variant(resize: '50x50')
  end
end
