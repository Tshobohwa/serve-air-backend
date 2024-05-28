class RemoveNameFromAddresses < ActiveRecord::Migration[7.1]
  def change
    remove_column :addresses, :name
  end
end
