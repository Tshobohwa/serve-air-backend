class Package < ApplicationRecord
  belongs_to :status, foreign_key: :status_id
  belongs_to :route, foreign_key: :route_id
  belongs_to :current_address, class_name: 'Address', foreign_key: :current_address_id
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id

  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :status_id, presence: true
  validates :route_id, presence: true
  validates :current_address_id, presence: true
  validates :creator_id, presence: true
  validates :sender_name, presence: true
  validates :sender_phone_number, presence: true, format: { with: /\A\+?[0-9]{10,15}\z/, message: "must be a valid phone number" }
  validates :receiver_name, presence: true
  validates :receiver_phone_number, presence: true, format: { with: /\A\+?[0-9]{10,15}\z/, message: "must be a valid phone number" }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
