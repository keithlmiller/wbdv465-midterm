class AddIsbnToBooks < ActiveRecord::Migration
  def change
    add_column_ :books, :ISBN, :string
  end
end
