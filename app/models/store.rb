class Store < ApplicationRecord
  has_many :members
  belongs_to :user

  with_options presence: true do
    validates :store_name
    validates :opening
    validates :closing
    validates :tel
  end

  validates :tel, uniqueness: true
end
