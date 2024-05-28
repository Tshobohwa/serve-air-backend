class AddTerritoryAndProvinceToAddresses < ActiveRecord::Migration[7.1]
  def change
    add_column :addresses, :territory, :string
    add_column :addresses, :province, :string
  end
end
