class Comment < ActiveRecord::Base
  belongs_to :article
  validates :commentateur,	presence: true,
							length: {minimum: 2,
									maximum: 20}
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
end
