class Member < ApplicationRecord
  belongs_to :store
  has_many :admins
end
