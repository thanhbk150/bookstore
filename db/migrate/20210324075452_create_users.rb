class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, :primary_key => :user_id do |t|
      t.string :first_name, null: false, :limit => 100
      t.string :last_name, null: false, :limit => 100
      t.string :email, null: false, :limit => 255
      t.string :phone, :limit => 50
      t.string :address, :limit => 255

      t.timestamps
    end
  end
end
