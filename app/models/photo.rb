class Photo < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  has_attached_file :image,
                    styles: { medium: "300x300#", thumb: "160x160#" },
                    default_url: "/assets/digital_cv/photo_cv.png"

  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
