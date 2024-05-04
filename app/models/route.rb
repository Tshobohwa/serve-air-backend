class Route < ApplicationRecord
  validates :pricing, presence: true, numericality: { greater_than_or_equal_to: 0 }
  has_many :addresses, foreign_key: :origin_id
  has_many :addresses, foreign_key: :destination_id
end
