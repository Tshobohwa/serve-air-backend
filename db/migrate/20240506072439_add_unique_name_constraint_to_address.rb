class AddUniqueNameConstraintToAddress < ActiveRecord::Migration[7.1]
  def change
    add_index :addresses, :name, unique: true
  end
end
