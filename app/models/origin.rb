class Origin < ApplicationRecord
  belongs_to :address, foreign_key: :address_id
  has_many :routes, foreign_key: :origin_id
end
