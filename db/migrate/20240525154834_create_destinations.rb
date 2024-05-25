class CreateDestinations < ActiveRecord::Migration[7.1]
  def change
    create_table :destinations do |t|
      t.integer :address_id

    end
    add_foreign_key :destinations, :addresses, column: :address_id
    add_index :destinations, :address_id, unique: :true
  end
end
