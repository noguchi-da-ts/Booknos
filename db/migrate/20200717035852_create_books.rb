class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :sub_title
      t.string :auther
      t.string :isbn_code, null: false
      t.string :jan_code
      t.string :image_url
      t.text :caption
      t.string :item_url


      t.date :released_at

      t.timestamps
    end
  end
end
