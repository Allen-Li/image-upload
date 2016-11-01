require 'pathname'

namespace :new_template do
  desc 'save template html to database.'
  task update_html: :environment do
    template_path = Rails.root.join('public/templates/*.{png, jpg, jpeg}')
    exist_files = Image.pluck(:asset_file_name).compact
    Dir.glob(template_path).map do |file_path|
      image_name = File.basename(file_path)
      if exist_files.exclude?(image_name)
        save_template file_path
      end
    end
  end

  def save_template file_path
    begin
      extn = File.extname  file_path 
      name = File.basename(file_path, extn)
      html_path = Rails.root.join("public/templates/#{name}.html")
      html = File.read(html_path)

      image = File.open(file_path)
      Image.create(html: html, asset: image)
    rescue => e
      p "#{name}: #{e}"
    ensure
      image.close
    end
  end
end
