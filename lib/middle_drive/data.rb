module MiddleDrive
  class Data

    def initialize(site)
      @data_document = site.spreadsheets.select { |s| s.title == 'data' }.first
    end

    def build(path)
      data_path = "#{path}/data"
      Dir.mkdir(data_path) unless File.exists?(data_path)

      @data_document.worksheets.each do |sheet|
        save_to = "#{data_path}/#{sheet.title}.yml"
        data = {}
        puts "Building list named #{sheet.title}"

        data_type = sheet[1, 1]

        if data_type == 'array' or data_type == 'hash'
          data[sheet.title] = [] if data_type == 'array'
          data[sheet.title] = {} if data_type == 'hash'

          (2..sheet.num_rows).each do |row|
            data[sheet.title] << sheet[row, 1] if data_type == 'array' # only one column
            data[sheet.title][sheet[row, 1]] = sheet[row, 2] if data_type == 'hash'
          end
        elsif data_type == 'list'
          data = build_list(sheet)
        end

        File.write(save_to, data.to_yaml)
      end
    end

    def build_list(sheet)
      data = { sheet.title => [] }
      (2..sheet.num_rows).each do |row|
        list_object = {}
        (2..sheet.num_cols).each do |col|
          list_object[sheet[1, col]] = sheet[row, col]
        end
        data[sheet.title] << list_object
      end
      data
    end

  end
end
