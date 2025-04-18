class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :text
      t.string :price
      t.string :book_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
