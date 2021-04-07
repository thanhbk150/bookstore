class CreatePublishers < ActiveRecord::Migration[6.1]
  def change
    create_table :publishers, :primary_key => :publisher_id do |t|
      t.string :name, null: false, :limit => 255
      t.string :phone, :limit => 50
      t.string :address, :limit => 255
      t.text :description, null: true
      t.timestamps
    end
  end
end
