class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false

      t.timestamps

      t.index [:name, :email], unique: true
    end
  end
end