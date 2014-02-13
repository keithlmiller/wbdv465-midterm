class List < ActiveRecord::Base
  belongs_to :user
  
  has_many :user_books
  has_many :books, through :user_books
  
  :status = ["Read", "Reading", "Will Read"]
end
