class CreateBookCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :book_categories, :primary_key => :book_category_id do |t|
      t.string :name, null: false, :limit => 255
      t.text :description, null: true

      t.timestamps
    end
  end
end
