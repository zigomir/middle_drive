require 'google_drive'
require 'google_drive/collection'

require 'middle_drive/version'
require 'middle_drive/config'

require 'middle_drive/image'
require 'middle_drive/page'
require 'middle_drive/data'
require 'middle_drive/update'

module MiddleDrive

  def self.init
    username = MiddleDrive::Config.get('gdrive.username')
    password = MiddleDrive::Config.get('gdrive.password')
    site_collection_title = MiddleDrive::Config.get('site.collection')

    session = GoogleDrive.login(username, password)
    @site = session.collection_by_title(site_collection_title)
    # site is our main folder/collection so we only search within it
    @build_path = MiddleDrive::Config.get('middleman.build_path')
  end

  def self.run
    MiddleDrive.init

    #i = Image.new(@site)
    #i.download(@build_path)
    #
    #p = Page.new(@site)
    #p.build(@build_path)

    languages = MiddleDrive::Config.get('site.languages')
    languages.each do |lang|
      d = Data.new(@site, lang)
      d.build(@build_path, lang)
    end
  end

  def self.update
    MiddleDrive.init

    u = Update.new(@site)
    if u.need_update?
      MiddleDrive.run
      u.complete_update!
    end
  end

end
