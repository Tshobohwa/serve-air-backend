class Address < ApplicationRecord
  validates :name, presence: true
  has_many :users, foreign_key: :address_id
  has_many :packages, foreign_key: :current_address_id
  has_many :routes, foreign_key: :origin_id, dependent: :destroy
  has_many :routes, foreign_key: :destination_id, dependent: :destroy
end
