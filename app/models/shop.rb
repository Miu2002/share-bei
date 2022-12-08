class Shop < ApplicationRecord
  has_many :posts
  has_many :users
  has_many :favorite_post, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
