

class SheetsRailsGenerator
    attr_accessor :title, :trix, :models

    def rails_app_name()
        @title.gsub(" ","").downcase()
    end

    def initialize(trix)
        puts "#DEB# SheetsRailsGenerator initializer for #{trix.title}!"
        @title = trix.title
        @trix = trix
        @models = [ "rails new #{rails_app_name}" ]
    end

    def to_s()
        "Trix('#{self.title}'). Models:\n - #{self.models.join("\n - ")}\n"
    end

    def addWorksheetModel(rails_generate_blurb)
        @models << rails_generate_blurb
    end


end