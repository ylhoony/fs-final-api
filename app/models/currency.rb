class Currency < ApplicationRecord
  has_many :companies
  
  validates :name, presence: true, uniqueness: true
  validates :alpha, presence: true, uniqueness: true, length: { is: 3 }
  validates :numeric, presence: true, uniqueness: true, length: { is: 3 }

  def self.active
    where(active: true)
  end
end
