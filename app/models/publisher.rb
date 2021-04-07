class Publisher < ApplicationRecord
	has_many :books, foreign_key: :publisher_id

	validates :name, presence: true, length: { maximum: 255 }
	validates :phone, length: { maximum: 50 }
	validates :address, length: { maximum: 255 }

	searchable auto_index: true do
		text :name, :description
	end
end
