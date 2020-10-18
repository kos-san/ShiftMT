class Store < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :store_name
    validates :opening
    validates :closing
    validates :tel
    validates :user
  end

  validates :tel, uniqueness: true
end
