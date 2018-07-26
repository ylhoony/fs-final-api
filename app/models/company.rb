class Company < ApplicationRecord
  scope :customers, -> { where(tyep: 'Customer') }
  scope :suppliers, -> { where(tyep: 'Supplier') }

  has_many :addresses
end
