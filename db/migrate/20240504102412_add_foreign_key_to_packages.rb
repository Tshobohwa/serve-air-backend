class AddForeignKeyToPackages < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :packages, :users, column: :creator_id
    add_index :packages, :creator_id
  end
end
