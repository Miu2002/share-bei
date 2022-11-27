class Post < ApplicationRecord
    belongs_to :user
    belongs_to :store
    validates :content, {presence: true, length: {maximum: 140}}
    validates :user_id, {presence: true}
    has_many :post_category_relations
    has_many :categories, through: :post_category_relations
    
end
