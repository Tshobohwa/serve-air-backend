class Address < ApplicationRecord
  validates :city, presence: true
  validates :territory, presence: true
  validates :province, presence: true
  has_many :users, foreign_key: :address_id
  has_many :packages, foreign_key: :current_address_id
  has_many :origins, foreign_key: :origin_id
  has_many :destinations, foreign_key: :destination_id
end
