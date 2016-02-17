class AddFlagged < ActiveRecord::Migration
  def change
  	add_column :articles, :flagged, :boolean
  end
end
