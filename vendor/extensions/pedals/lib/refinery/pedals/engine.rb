module Refinery
  module Pedals
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Pedals

      engine_name :refinery_pedals

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "pedals"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.pedals_admin_pedals_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/pedals/pedal',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Pedals)
      end
    end
  end
end
