class User < ApplicationRecord
  validates :name, { presence: true }
  validates :email, { presence: true, uniqueness: true }
  validates :password, { presence: true }
  has_many :shops, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
