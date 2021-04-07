class Book < ApplicationRecord
	belongs_to :author, foreign_key: :author_id, optional: false
	belongs_to :book_category, foreign_key: :book_category_id, optional: false
	belongs_to :publisher, foreign_key: :publisher_id, optional: true

	validates :book_category_id, presence: true, length: { maximum: 20 }
	validates :author_id, presence: true, length: { maximum: 20 }
	validates :publisher_id, length: { maximum: 20 }
	validates :title, presence: true, length: { maximum: 255 }
	validates :edition_number, numericality: { only_integer: true }, length: { maximum: 11 }, allow_blank: true
	validates :copyright, length: { maximum: 255 }
	validates :price, numericality: { only_float: true }, allow_blank: true
	validates :quantity, numericality: { only_integer: true }, length: { maximum: 20 }, allow_blank: true
	validates :image, length: { maximum: 255 }

	searchable auto_index: true do
		text :title, :description
	end
end
