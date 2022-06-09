class Gif < ApplicationRecord
  has_one_attached :image

  validate :acceptable_image

  def acceptable_image
    return unless image.attached?
  
    unless image.byte_size <= 1.megabyte
      errors.add(:image, "is too big")
    end
  
    unless image.content_type == "image/gif"
      errors.add(:image, "must be a GIF")
    end
  end
end
