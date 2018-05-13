class Order < ApplicationRecord
	has_many :cart_items, dependent: :destroy
	PAYMENT_TYPES = ["Check", "Credit card", "Purchase order" ]

	validates :name, :address, :email, :phone, presence: true
	# validates :pay_type, inclusion: PAYMENT_TYPES
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :phone, numericality: true, length: { minimum: 8 }

	def add_cart_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			cart_items << item
		end
	end
end
