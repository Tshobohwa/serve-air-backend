class AddUniqueConstraintToRoutes < ActiveRecord::Migration[7.1]
  def change
    add_index :routes, [:origin_id, :destination_id], unique: true
  end
end
