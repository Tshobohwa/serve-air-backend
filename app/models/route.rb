class Route < ApplicationRecord
  validates :pricing, presence: true, numericality: { greater_than: 0 }
  belongs_to :origin, foreign_key: :origin_id
  belongs_to :destination, foreign_key: :destination_id
  has_many :packages, foreign_key: :route_id
end
