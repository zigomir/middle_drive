module MiddleDrive
  class Data

    def initialize(site, lang)
      @data_document = site.spreadsheets.select { |s| s.title == "data_#{lang}" }.first
    end

    def build(path, lang)
      data_path = "#{path}/data"
      Dir.mkdir(data_path) unless File.exists?(data_path)

      @data_document.worksheets.each do |sheet|
        save_to = "#{data_path}/#{sheet.title}_#{lang}.yml"
        data = {}
        puts "Saving data for #{sheet.title}_#{lang}"

        template_name, data_type = sheet[1, 1].split(':')

        if data_type == 'array' or data_type == 'hash'
          data[template_name] = [] if data_type == 'array'
          data[template_name] = {} if data_type == 'hash'

          (2..sheet.num_rows).each do |row|
            data[template_name] << sheet[row, 1] if data_type == 'array' # only one column
            data[template_name][sheet[row, 1]] = sheet[row, 2] if data_type == 'hash'
          end
        elsif data_type == 'list'
          data = build_list(sheet, template_name)
        end

        File.write(save_to, data.to_yaml)
      end
    end

    def build_list(sheet, template_name)
      data = { template_name => [] }
      (2..sheet.num_rows).each do |row|
        list_object = {}
        (2..sheet.num_cols).each do |col|
          list_object[sheet[1, col]] = sheet[row, col]
        end
        data[template_name] << list_object
      end
      data
    end

  end
end
