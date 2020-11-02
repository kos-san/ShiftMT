class Store < ApplicationRecord
  has_many :members
  has_many :admins
  belongs_to :user
  has_many :shifts
  has_many :tables
  has_many :contacts

  with_options presence: true do
    validates :store_name
    validates :opening
    validates :closing
    validates :tel
  end

  validates :tel, uniqueness: true
end
