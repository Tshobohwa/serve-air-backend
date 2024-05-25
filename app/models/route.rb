class Route < ApplicationRecord
  validates :pricing, presence: true, numericality: { greater_than_or_equal_to: 0 }
  belongs_to :origin, class_name: 'Address', foreign_key: 'origin_id'
  belongs_to :destination, class_name: 'Address', foreign_key: 'destination_id'
end
