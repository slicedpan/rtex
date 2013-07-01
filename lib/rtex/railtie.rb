module RTeX
  class Railtie < Rails::Railtie
    initializer "rtex.add_template_handler" do 
      ActionView::Template.register_template_handler("rtex", 
        RTeX::TemplateHandler)
    end
    initializer "rtex.add_controller_methods" do
      ActionController::Base.send(:include, RTeX::ControllerMethods)
    end
    initializer "rtex.add_helper_methods" do
      ActionView::Base.send(:include, RTeX::Helpers)
    end
    initializer "rtex.set_tempdir" do 
      ActiveSupport.on_load(:action_controller) do
        Document.options[:tempdir] = Rails.root.join("tmp")
      end
    end
    initializer "rtex.set_assets_dir" do
      ActiveSupport.on_load(:action_controller) do
        RTeX::Helpers.set_assets_path Rails.root.join("report")
      end
    end
    initializer "rtex.set_auto_delete" do
      RTeX::Tempdir.auto_delete = false if Rails.env.development?
    end
    initializer "rtex.read_config" do
      ActiveSupport.on_load(:action_controller) do
        unless Settings.nil? || Settings.rtex.nil?
          RTeX::Document.options.merge(Settings.rtex)    
        end
      end
    end
  end
end
