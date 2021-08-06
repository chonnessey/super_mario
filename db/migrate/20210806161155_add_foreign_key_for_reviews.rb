class AddForeignKeyForReviews < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :reviews, :products
  end
end
