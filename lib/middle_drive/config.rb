require 'yaml'

module MiddleDrive
  module Config

    @settings = YAML.load(File.open('middle_drive.yml'))

    # 'gdrive.username' => @settings['gdrive']['username']
    def self.get(key)
      keys   = key.split('.')
      values = @settings
      keys.each do |k|
        values = values[k]
      end
      values
    end

    def self.max_languages
      5
    end

  end
end
