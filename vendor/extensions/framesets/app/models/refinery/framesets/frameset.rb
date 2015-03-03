module Refinery
  module Framesets
    class Frameset < Refinery::Core::BaseModel
      self.table_name = 'refinery_framesets'

      attr_accessible :name, :hero_image_id, :hero_background_image_id, :color, :weight, :description, :position

      translates :name, :color, :description

      class Translation
        attr_accessible :locale
      end

      validates :name, :presence => true, :uniqueness => true

      belongs_to :hero_image, :class_name => '::Refinery::Image'

      belongs_to :hero_background_image, :class_name => '::Refinery::Image'
    end
  end
end
