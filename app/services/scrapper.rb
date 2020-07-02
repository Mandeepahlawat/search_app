require 'nokogiri'
require 'open-uri'

class Scrapper
	attr_accessor :url

	def initialize(url)
		@url = url
	end

	def scrape
		headers = []

		begin
			page = Nokogiri::HTML.parse(open(self.url))
			['h1', 'h2', 'h3'].each do |header|
				headings = page.css(header)
				headings = headings.map(&:text)
				headers << headings
			end
		rescue
			puts 'page not found'
		end

		headers.flatten
	end
end