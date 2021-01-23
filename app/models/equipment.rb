class Equipment < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :ad_name, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :active, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
end
