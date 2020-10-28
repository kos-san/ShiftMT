class Table < ApplicationRecord
  belongs_to :store
  belongs_to :shift

  with_options presence: true do
    validates :workday
    validates :start
    validates :ending
  end
end
