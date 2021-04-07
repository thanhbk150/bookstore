class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books, :primary_key => :book_id do |t|
      t.bigint :author_id, null: false, :limit => 20
      t.bigint :publisher_id, null: true, :limit => 20
      t.bigint :book_category_id, null: false, :limit => 20
      t.string :title, null: false, :limit => 255
      t.integer :edition_number
      t.string :copyright, :limit => 255
      t.text :description, null: true
      t.float :price, default: 0
      t.bigint :quantity, default: 0
      t.string :image, :limit => 255

      t.timestamps
    end
  end
end
