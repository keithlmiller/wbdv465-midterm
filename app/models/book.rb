class Book < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true
  validates :summary, presence: true
  validates :ISBN, length: {is: 10}
  
end
