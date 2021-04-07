class Author < ApplicationRecord
	has_many :books, foreign_key: :author_id, dependent: :destroy

	validates :first_name, presence: true, length: { maximum: 100 }
	validates :last_name, presence: true, length: { maximum: 100 }
	validates :gender, presence: true, numericality: { only_integer: true }, length: { maximum: 1 }
	validates :email, length: { maximum: 255 }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, allow_blank: true
	validates :phone, length: { maximum: 50 }
	validates :address, length: { maximum: 255 }
	validates :image, length: { maximum: 255 }

	searchable auto_index: true do
		text :first_name, :last_name
	end
end
