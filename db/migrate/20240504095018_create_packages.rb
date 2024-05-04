class CreatePackages < ActiveRecord::Migration[7.1]
  def change
    create_table :packages do |t|
      t.float :weight
      t.text :description
      t.integer :status_id
      t.integer :route_id
      t.integer :current_address_id

      t.timestamps
    end
    add_foreign_key :packages, :statuses, column: :status_id
    add_index :packages, :status_id
    add_foreign_key :packages, :routes, column: :route_id
    add_index :packages, :route_id
    add_foreign_key :packages, :addresses, column: :current_address_id
  end
end
