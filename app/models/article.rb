class Article < ActiveRecord::Base
	has_many :contenus
	has_many :comments
	validates :titre, 	presence: true,
						length: { minimum: 3 }
end
