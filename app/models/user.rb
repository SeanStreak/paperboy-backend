class User < ApplicationRecord
	#has  a password
	has_secure_password
	#has a name
	validates :name, presence: true
	#has an inlink
	validates :inlink, presence: true

	#has one inbox
	has_one :inbox

	#has many notes
	has_many :notes
end
