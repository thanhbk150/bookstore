class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors, :primary_key => :author_id do |t|
      t.string :first_name, null: false, :limit => 100
      t.string :last_name, null: false, :limit => 100
      t.integer :gender, default: 0, :limit => 1
      t.text :biography, null: true
      t.string :email, :limit => 255
      t.string :phone, :limit => 50
      t.string :address, :limit => 255
      t.string :image, :limit => 255

      t.timestamps
    end
  end
end
