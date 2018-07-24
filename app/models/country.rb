class Country < ApplicationRecord
  has_many :accounts
  has_many :warehouses

  validates :name, presence: true, uniqueness: true
  validates :alpha2, presence: true, uniqueness: true, length: { is: 2 }
  validates :alpha3, presence: true, uniqueness: true, length: { is: 3 }
  validates :numeric, presence: true, uniqueness: true, length: { is: 3 }

  def self.active
    where(active: true)
  end
end