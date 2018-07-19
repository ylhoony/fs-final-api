class PaymentOption < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  def self.active
    where(active: true)
  end
end
