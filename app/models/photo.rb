class Photo < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  has_attached_file :image,
                    styles: { small: "160x80#", medium: "300x300#",
                             thumb: "160x160#", large: "1200x250#" },
                    default_url: :default_image_url

  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  def default_image_url
    case image_type
    when 'profile_image'
      "/assets/business_directory/no_image_small.png"
    when 'cover_image'
      "/assets/business_directory/no-image-available.jpg"
    when 'digital_cv'
      "/assets/digital_cv/photo_cv.png"
    end
  end
end
