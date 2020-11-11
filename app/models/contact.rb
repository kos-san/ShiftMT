class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :store

  validates :text, presence: true
end
