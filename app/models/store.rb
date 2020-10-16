class Store < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :store_name
    validates :opning
    validates :closing
    validates :user
end
