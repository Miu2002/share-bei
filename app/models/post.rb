class Post < ApplicationRecord
    validates :content, {presence: true, length: {maximum: 140}}
    validates :user_id, {presence: true}
    has_many :post_category_relations
    has_many :categories, through: :post_category_relations
    
end
