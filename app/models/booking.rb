class Booking < ApplicationRecord
  STATUS = %w[pending confirmed cancelled finished]
  belongs_to :equipment
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_date, :end_date, overlap: { scope: "equipment_id" }
  validates :status, inclusion: { in: STATUS }, presence: true
  validate :end_date_valid?, :start_date_valid?

  def start_date_valid?
    past = start_date.strftime("%m/%d/%Y") < Time.now.strftime("%m/%d/%Y")
    errors.add(:start_date, "Can't be set before today") if past
  end

  def end_date_valid?
    errors.add(:end_date, "Can't be set before start date") if end_date < start_date
  end
end
