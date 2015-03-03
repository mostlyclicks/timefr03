module Refinery
  module Framesets
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Framesets

      engine_name :refinery_framesets

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "framesets"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.framesets_admin_framesets_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/framesets/frameset',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Framesets)
      end
    end
  end
end
