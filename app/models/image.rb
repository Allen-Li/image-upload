class Image < ApplicationRecord
  has_attached_file :asset,
    storage: :s3,
    styles: { medium: '300x300>', thumb: '100x100>' },
    path: ':env_folder/:attachment/:id/:style/:filename.:extension',
    content_type: { content_type: 'image/jpeg' }

  validates_attachment_content_type :asset,
    :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    # :path => ":rails_root/public/uploads/images/:id_:style_:fingerprint.:extension",
    # :url => "/uploads/images/:id_:style_:fingerprint.:extension"
end
