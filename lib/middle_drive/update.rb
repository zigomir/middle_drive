module MiddleDrive
  class Update
    def initialize(site)
      @update_document = site.spreadsheets.select { |s| s.title == 'update' }.first
    end

    def need_update?
      if @update_document && @update_document.worksheets.length > 0
        return @update_document.worksheets[0][1,1] == 'please update'
      end

      false
    end

    def complete_update!
      sheet = @update_document.worksheets[0]
      sheet[1,1] = ''
      sheet.save
    end
  end
end
