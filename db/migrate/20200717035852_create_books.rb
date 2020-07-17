class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :auther
      t.string :isbn_code
      t.string :jan_code
      t.date :released_at

      t.timestamps
    end
  end
end
