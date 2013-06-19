module RTeX
  module Helpers
    def self.set_assets_path path
      @@path = path
    end
    def report_image_path filename
      @@path.join("images", filename)
    end
    def latex_escape(*args)
      RTeX::Document.escape(*args).html_safe
    end
    alias :tex :latex_escape
  end
end
