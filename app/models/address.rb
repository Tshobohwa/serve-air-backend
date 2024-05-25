class Address < ApplicationRecord
  validates :name, presence: true
  has_many :users, foreign_key: :address_id
  has_many :packages, foreign_key: :current_address_id
  has_many :origins, class_name: 'Route', foreign_key: 'origin_id'
  has_many :destinations, class_name: 'Route', foreign_key: 'destination_id'
end
