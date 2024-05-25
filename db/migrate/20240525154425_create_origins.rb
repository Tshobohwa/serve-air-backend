class CreateOrigins < ActiveRecord::Migration[7.1]
  def change
    create_table :origins do |t|
      t.integer :address_id

    end
    add_foreign_key :origins, :addresses, column: :address_id
    add_index :origins, :address_id, unique: true
  end
end
