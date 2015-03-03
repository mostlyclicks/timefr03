module Refinery
  module Framesets
    module Admin
      class FramesetsController < ::Refinery::AdminController

        crudify :'refinery/framesets/frameset',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
