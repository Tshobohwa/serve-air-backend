class AddCreatorIdToPackages < ActiveRecord::Migration[7.1]
  def change
    add_column :packages, :creator_id, :integer
  end
end
