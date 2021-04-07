class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

	validates :first_name, presence: true, length: { maximum: 100 }
	validates :last_name, presence: true, length: { maximum: 100 }
	validates :email, length: { maximum: 255 }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	validates :phone, length: { maximum: 50 }
	validates :address, length: { maximum: 255 }

	searchable auto_index: true do
		text :first_name, :last_name, :email
	end
end
