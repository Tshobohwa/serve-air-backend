class AddUniqueNameConstraintToStatuses < ActiveRecord::Migration[7.1]
  def change
    add_index :statuses, :name, unique: true
  end
end
