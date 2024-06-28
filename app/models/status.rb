class Status < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  has_many :packages, foreign_key: :status_id
end
