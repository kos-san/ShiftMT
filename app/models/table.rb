class Table < ApplicationRecord
  belongs_to :store
  belongs_to :shift
end
