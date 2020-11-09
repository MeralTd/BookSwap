class Comment < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :book
  belongs_to :user
  scope :approved, -> { where status: 'approved'}
  scope :unapproved, -> { where status: 'unapproved'}
  
end
