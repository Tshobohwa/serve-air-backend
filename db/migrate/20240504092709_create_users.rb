class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :address_id

      t.timestamps
    end
    add_foreign_key :users, :addresses, column: :address_id
    add_index :users, :address_id
  end
end
