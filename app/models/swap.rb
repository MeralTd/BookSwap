class Swap < ApplicationRecord
    belongs_to :user
    belongs_to :other, class_name: 'User', foreign_key: 'other_id'
    
    validates :user_id, :other_id, :book_id, presence: true
end
