class CreateReturns < ActiveRecord::Migration[5.2]
  def change
    create_table :returns do |t|
      t.references :borrow, foreign_key: true

      t.timestamps
    end
  end
end
