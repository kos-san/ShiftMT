class Admin < ApplicationRecord
  belongs_to :store
  belongs_to :member
end
