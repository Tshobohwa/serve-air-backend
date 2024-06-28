class AddPriceToPackage < ActiveRecord::Migration[7.1]
  def change
    add_column :packages, :price, :decimal
  end
end
