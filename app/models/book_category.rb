class BookCategory < ApplicationRecord
	has_many :books, foreign_key: :book_category_id, dependent: :destroy

	validates :name, presence: true, length: { maximum: 255 }

	searchable auto_index: true do
		text :name, :description
	end

end
