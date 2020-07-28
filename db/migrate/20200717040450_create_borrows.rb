class CreateBorrows < ActiveRecord::Migration[5.2]
  def change
    create_table :borrows do |t|
      t.references :book, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.boolean :is_returned, default: false, null: false
      
      
      t.timestamps
    end
  end
end
