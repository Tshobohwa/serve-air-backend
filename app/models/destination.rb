class Destination < ApplicationRecord
  belongs_to :address, foreign_key: :address_id, dependent: :destroy
  has_many :routes, foreign_key: :destination_id
end
