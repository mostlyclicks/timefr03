module Refinery
  module Pedals
    module Admin
      class PedalsController < ::Refinery::AdminController

        crudify :'refinery/pedals/pedal',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
