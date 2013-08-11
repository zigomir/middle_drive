module MiddleDrive
  class Image

    def initialize(site)
      @images = site.subcollection_by_title('images')
    end

    def download(path)
      Dir.mkdir(path) unless File.exists?(path)

      @images.files.each do |image_file|
        save_to = "#{path}/source/images/#{image_file.title}"

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
