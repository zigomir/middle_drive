module MiddleDrive
  class Page

    def initialize(site)
      @languages = MiddleDrive::Config.get('site.languages')
      @pages_document = site.spreadsheets.select { |s| s.title == 'pages' }.first
    end

    def build(path)
      locales_path = "#{path}/locales"
      Dir.mkdir(locales_path) unless File.exists?(locales_path)

      # each tab is a page
      pages = {'pages' => {}}

      # init lang hash
      lang_keys = {}
      @languages.each do |lang|
        lang_keys[lang] = {}
      end

      @pages_document.worksheets.each do |page|
        puts "Building key value pairs for page named #{page.title}"
        # in very first row we specify page's template
        pages['pages'][page.title] = page[1, 1]

        @languages.each do |lang|
          lang_keys = load_language_values(lang_keys, page, lang)
        end
      end

      @languages.each do |lang|
        output = {}
        output[lang] = lang_keys[lang]
        File.write("#{locales_path}/#{lang}.yml", output.to_yaml)
      end

      File.write("#{path}/pages.yml", pages.to_yaml)
    end

    def load_language_values(hash, sheet, lang)
      column_index = get_language_column_index(sheet, lang)
      hash[lang][sheet.title] = {}

      (2..sheet.num_rows).each do |row|
        key   = sheet[row, 1]
        value = sheet[row, column_index]
        hash[lang][sheet.title][key] = value
      end

      hash
    end

    def get_language_column_index(sheet, lang)
      (1..MiddleDrive::Config.max_languages).each do |column|
        return column if sheet[1, column] == lang
      end
      0
    end

  end
end
