class PaymentOption < ApplicationRecord
  has_many :payment_terms
  
  validates :name, presence: true, uniqueness: true

  def self.active
    where(active: true)
  end
end
