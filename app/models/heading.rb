class Heading < ApplicationRecord
  belongs_to :website
  delegate :user, to: :website

  scope :by_title, -> (title) { where('lower(title) LIKE ?', "%#{title}%") }

  def self.get_user_ids(title)
  	self.by_title(title).map(&:user).map(&:id).uniq
  end
end
