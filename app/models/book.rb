class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :pagecount, presence: true

  enum status_type: {share: "share", not_share: "not_share"}


  has_many :comments
  belongs_to :user

  def is_swapped
    Swap.where(book_id: self.id, status:"accepted").first or Swap.where(other_book_id: self.id, status: "accepted").first
  end
  
  def swaps_count
    count = Swap.where(book_id: self.id, status:"accepted").count + Swap.where(other_book_id: self.id, status: "accepted").count
  end

  def self.search(search)
    where("title LIKE ?", "%#{search}%") 
    where("title LIKE ?", "%#{search}%")
  end

end
