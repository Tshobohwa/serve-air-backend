class AddSenderAndReceiverToPackages < ActiveRecord::Migration[7.1]
  def change
    add_column :packages, :sender_name, :string
    add_column :packages, :sender_phone_number, :string
    add_column :packages, :receiver_name, :string
    add_column :packages, :receiver_phone_number, :string
  end
end
