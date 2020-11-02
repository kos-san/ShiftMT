class Shift < ApplicationRecord
  belongs_to :user
  belongs_to :store

  with_options presence: true do
    validates :workday
    validates :start
    validates :ending
    validates :user
    validates :store
  end
end
