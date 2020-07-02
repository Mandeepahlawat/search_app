class User < ApplicationRecord
	has_one :website
	accepts_nested_attributes_for :website

	has_many :headings, through: :website
	has_many :friendships
	has_many :friends, through: :friendships

	validates :name, presence: true, uniqueness: { case_sensitive: false }
end
