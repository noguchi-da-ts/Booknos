class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.boolean :admin, default: false
      t.string :name, null: false, unique: true
      t.string :email, null: false, unique: true
      t.string :password_digest
      t.string :remember_digest

      t.timestamps

      t.index [:name, :email], unique: true
    end
  end
end
