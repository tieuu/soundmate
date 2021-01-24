class Equipment < ApplicationRecord
  CATEGORY = %w[brass guitar keyboard percussion strings woodwind equipment turntable]
  belongs_to :user
  has_many :bookings
  validates :ad_name, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORY }
  validates :description, presence: true
  validates :active, presence: true
  validates :price, presence: true
end
