class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name, length: { maximum: 50 }
  validate :nickname
  
  def nickname
    self.user_name = self.email.split('@').first
    if self.user_name.length < 5
      self.user_name = self.user_name + self.user_name
    end
  end
  has_many :books
  has_many :comments
  has_many :swaps


end
