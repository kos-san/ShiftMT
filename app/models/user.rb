class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :stores
  has_many :members
  has_many :shifts

  with_options presence: true do
    validates :name
    validates :phone_num
  end
end
