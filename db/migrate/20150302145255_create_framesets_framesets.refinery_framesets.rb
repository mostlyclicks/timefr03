# This migration comes from refinery_framesets (originally 1)
class CreateFramesetsFramesets < ActiveRecord::Migration

  def up
    create_table :refinery_framesets do |t|
      t.string :name
      t.integer :hero_image_id
      t.integer :hero_background_image_id
      t.string :color
      t.integer :weight
      t.text :description
      t.integer :position

      t.timestamps
    end

    Refinery::Framesets::Frameset.create_translation_table! :name => :string, :color => :string, :description => :text

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-framesets"})
    end

    drop_table :refinery_framesets

    Refinery::Framesets::Frameset.drop_translation_table!

  end

end
