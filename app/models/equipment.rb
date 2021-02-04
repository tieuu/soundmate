class Equipment < ApplicationRecord
  CATEGORY = %w[brass guitar keyboard percussion strings woodwind equipment turntable]
  belongs_to :user
  has_many :bookings
  has_many :reviews, dependent: :destroy
  validates :ad_name, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORY }
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_equipment,
                  against: %i[category description ad_name],
                  using: {
                    tsearch: { prefix: true }
                  }
end
