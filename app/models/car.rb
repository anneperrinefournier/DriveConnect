class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo, dependent: :destroy

  validates :brand, presence: true
  validates :model, presence: true
  validates :address, presence: true
  validates :price_per_day, numericality: { greater_than: 0 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
