# This migration comes from refinery_pedals (originally 1)
class CreatePedalsPedals < ActiveRecord::Migration

  def up
    create_table :refinery_pedals do |t|
      t.string :name
      t.string :riding_type
      t.string :category
      t.integer :weight
      t.text :description
      t.integer :pedal_image_id
      t.integer :position

      t.timestamps
    end

    Refinery::Pedals::Pedal.create_translation_table! :name => :string, :riding_type => :string, :category => :string, :description => :text

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-pedals"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/pedals/pedals"})
    end

    drop_table :refinery_pedals

    Refinery::Pedals::Pedal.drop_translation_table!

  end

end
