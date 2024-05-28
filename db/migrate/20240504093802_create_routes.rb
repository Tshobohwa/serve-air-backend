class CreateRoutes < ActiveRecord::Migration[7.1]
  def change
    create_table :routes do |t|
      t.integer :origin_id
      t.integer :destination_id
      t.decimal :pricing

      t.timestamps
    end
    add_foreign_key :routes, :addresses, column: :origin_id
    add_foreign_key :routes, :addresses, column: :destination_id

  end
end
