class Book < ActiveRecord::Base
  
  acts_as_taggable_on :tags
  
  validates :title, presence: true
  validates :author, presence: true
  validates :summary, presence: true
  validates :ISBN, length: {is: 10}
  
  has_many :user_books
  has_many :lists, through: :user_books
  
end
