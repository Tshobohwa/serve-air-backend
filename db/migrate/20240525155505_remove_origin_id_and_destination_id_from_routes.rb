class RemoveOriginIdAndDestinationIdFromRoutes < ActiveRecord::Migration[7.1]
  def change
    remove_column :routes, :origin_id, :integer
    remove_column :routes, :destination_id, :integer
  end
end
