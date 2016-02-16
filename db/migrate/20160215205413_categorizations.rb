class Categorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.references :category
      t.references :version

      t.timestamps(null: false)
    end
  end
end
