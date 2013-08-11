require 'middle_drive/version'
require 'middle_drive/config'
require 'google_drive'
require 'google_drive/collection'

module MiddleDrive

  # Logs in.
  # You can also use OAuth. See document of
  # GoogleDrive.login_with_oauth for details.
  username = MiddleDrive::Config.get('gdrive.username')
  password = MiddleDrive::Config.get('gdrive.password')
  site_collection_title = MiddleDrive::Config.get('site.collection')
  site_images_collection_title = MiddleDrive::Config.get('site.images_collection')

  session = GoogleDrive.login(username, password)
  site    = session.collection_by_title(site_collection_title)
  images  = site.subcollection_by_title(site_images_collection_title)

  build_path = MiddleDrive::Config.get('middleman.build_path')

  images.files.each do |image_file|
    save_to = "#{build_path}/images/#{image_file.title}"

    if File.exist?(save_to)
      puts "File #{save_to} already exists..."
    else
      puts "Downloading #{image_file.title} to #{save_to}..."
      image_file.download_to_file(save_to)
    end
  end

end
