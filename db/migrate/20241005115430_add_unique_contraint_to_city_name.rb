class AddUniqueContraintToCityName < ActiveRecord::Migration[7.1]
  def change
    add_index :addresses, :city, unique: true
  end
end
