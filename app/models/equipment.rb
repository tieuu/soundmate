class Equipment < ApplicationRecord
  CATEGORY = %w[brass guitar keyboard percussion strings woodwind equipment turntable]
  belongs_to :user
  has_many :bookings
  validates :ad_name, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORY }
  validates :description, presence: true
  validates :active, presence: true
  validates :price, presence: true

  def self.search(search)
    return unless search

    if search[:query].size.positive? && search[:category].size.positive?
      Equipment.where('ad_name ILIKE ?', "%#{search[:query]}%").where(category: search[:category])
    elsif search[:query].empty?
      Equipment.where(category: search[:category])
    else
      Equipment.where('ad_name ILIKE ?', "%#{search[:query]}%")
    end
  end
end
