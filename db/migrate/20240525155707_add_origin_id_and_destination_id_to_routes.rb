class AddOriginIdAndDestinationIdToRoutes < ActiveRecord::Migration[7.1]
  def change
    add_column :routes, :origin_id, :integer
    add_column :routes, :destination_id, :integer
    add_foreign_key :routes, :origins, column: :origin_id
    add_index :routes, :origin_id
    add_foreign_key :routes, :destinations, column: :destination_id
    add_index :routes, :destination_id
  end
end
