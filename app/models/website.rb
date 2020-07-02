class Website < ApplicationRecord
  belongs_to :user
  has_many :headings

  validates :url, presence: true

  after_validation :shorten_url 

  after_save :fetch_and_create_headings , if: lambda { |u| u['url'][0] != u['url'][1] }

  private

  	def shorten_url
  		short_url = ShortURL.shorten(self.url)
			self.short_url = short_url
  	end

  	# delete all existing headings and fetch new headings only if url changed
  	def fetch_and_create_headings
  		self.headings.destroy_all

  		scrapper = Scrapper.new(self.url)
  		new_headings = scrapper.scrape

  		if new_headings.length
	  		data = []
	  		new_headings.each do |heading|
	  			data << {title: heading, website_id: self.id, created_at: Time.now, updated_at: Time.now}
	  		end
	  		Heading.upsert_all(data)
	  	end
  		
  	end
end
