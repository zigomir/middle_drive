module MiddleDrive
  class Data

    def initialize(site)
      @data_document = site.spreadsheets.select { |s| s.title == 'data' }.first
    end

    def build(path)
      data_path = "#{path}/data"
      Dir.mkdir(data_path) unless File.exists?(data_path)
      save_to = "#{data_path}/data.yml"

      data = {}
      @data_document.worksheets.each do |sheet|
        puts "Building list named #{sheet.title}"

        data[sheet.title] = []
        (1..sheet.num_rows).each do |row|
          data[sheet.title] << sheet[row, 1] # only one column
        end
      end

      File.write(save_to, data.to_yaml)
    end

  end
end
