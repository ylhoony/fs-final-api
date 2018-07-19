class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :employees
  has_many :accounts, through: :employees

  def current_account
    self.accounts.find_by(id: self.current_account_id)
  end

  def current_account=(account)
    update(current_account_id: account.id)
  end

end
