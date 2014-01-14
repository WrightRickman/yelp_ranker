class Url < ActiveRecord::Base
	attr_accessible :url

	def parse_url
		self.scan(/ny/).gsub("newyorkny", "")
	end

end