class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :equipments
  has_many :bookings
  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
end
