class Package < ApplicationRecord
  validates :weight, presence: true
  validates :description, presence: true
  belongs_to :status, foreign_key: :status_id
  belongs_to :route, foreign_key: :route_id
  belongs_to :address, foreign_key: :current_address_id
  belongs_to :user, foreign_key: :creator_id
end
