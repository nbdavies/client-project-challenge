class Versions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.integer :article_id, null: false
      t.integer :author_id, null: false
      t.text :content
      t.boolean :draft
      t.boolean :published
      t.string :image_url
      t.string :image_caption
      t.timestamps null: false
    end
  end
end
