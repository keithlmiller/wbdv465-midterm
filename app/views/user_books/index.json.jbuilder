json.array!(@user_books) do |user_book|
  json.extract! user_book, :id
  json.url user_book_url(user_book, format: :json)
end
