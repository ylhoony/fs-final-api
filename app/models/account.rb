class Account < ApplicationRecord
  belongs_to :country
  belongs_to :currency
  has_many :addresses
  has_many :contacts
  has_many :customers
  has_many :suppliers
  has_many :employees
  has_many :users, through: :employees
  has_many :payment_terms
  has_many :product_brands
  has_many :product_categories
  has_many :products
  has_many :warehouses
  has_many :sales_orders
  has_many :purchase_orders

  validates :name, presence: true
  validates :country_id, presence: true
  validates :currency_id, presence: true
end
