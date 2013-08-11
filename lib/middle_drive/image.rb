module MiddleDrive
  class Image

    def initialize(site)
      site_images_collection_title = MiddleDrive::Config.get('site.images_collection')
      @images = site.subcollection_by_title(site_images_collection_title)
    end

    def download(build_path)
      @images.files.each do |image_file|
        save_to = "#{build_path}/images/#{image_file.title}"

        if File.exist?(save_to)
          puts "File #{save_to} already exists..."
        else
          puts "Downloading #{image_file.title} to #{save_to}..."
          image_file.download_to_file(save_to)
        end
      end
    end

  end
end
