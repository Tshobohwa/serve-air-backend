class AddDescriptionToStatuses < ActiveRecord::Migration[7.1]
  def change
    add_column :statuses, :description, :text
  end
end
