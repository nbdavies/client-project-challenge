class Articles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.integer :author_id

      t.timestamps null: false
    end
  end
end
