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

  validates :tel, format: { with: /\A\d{10,11}\z/, message: 'を正しく入力してください'}

  with_options numericality: {less_than_or_equal_to: 23} do
    validates :opening
    validates :closing
  end

  with_options uniqueness: true do
    validates :tel
    validates :store_name
  end

end
