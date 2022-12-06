class Shop < ApplicationRecord
  has_many :posts
  has_many :favorites, dependent: :destroy
end
