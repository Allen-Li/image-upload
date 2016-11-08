Paperclip.interpolates :url_encoded_filename do |image, _style|
  URI.escape(image.original_filename)
end

# interpolate in paperclip
Paperclip.interpolates :env_folder do |_attachment, _style|
  Rails.env
end