class Booking < ApplicationRecord
  STATUS = %w[pending confirmed cancelled finished]
  belongs_to :equipment
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, inclusion: { in: STATUS }, presence: true
  validate :end_date_valid?

  def end_date_valid?
    errors.add(:end_date, "Can't be set to a past date") if end_date < start_date
  end
end
