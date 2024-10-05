class AddOriginAndDestinationToPackage < ActiveRecord::Migration[7.1]
  def change
    add_column :packages, :origin_id, :integer
    add_column :packages, :destination_id, :integer
    add_foreign_key :packages, :addresses, column: :origin_id
    add_index :packages, :origin_id
    add_foreign_key :packages, :addresses, column: :destination_id
    add_index :packages, :destination_id
  end
end
