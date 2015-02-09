class AddSlugToPedals < ActiveRecord::Migration
  def change
    add_column :refinery_pedals, :slug, :string
    add_index :refinery_pedals, :slug
  end
end
