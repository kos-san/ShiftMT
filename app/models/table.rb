class Table < ApplicationRecord
  belongs_to :store
  belongs_to :user

  with_options presence: true do
    validates :workday
    validates :start
    validates :ending
  end
end
