class Store < ApplicationRecord
  belongs_to :user
  has_many :members

  with_options presence: true do
    validates :store_name
    validates :opening
    validates :closing
    validates :tel
    validates :user
  end

  validates :tel, uniqueness: true
end
