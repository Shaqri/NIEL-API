class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, unique: true
      t.string :password_hash, null: false
      t.string :country, null: false
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
