class Book < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true
  validates :summary, presence: true
  validates :ISBN, length: {is: 10}
  
  has_many :user_books
  has_many :books, through: :user_books
  
end
