class Booking < ApplicationRecord
  STATUS = %w[pending confirmed cancelled]
  belongs_to :equipment
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, inclusion: { in: STATUS }
end
