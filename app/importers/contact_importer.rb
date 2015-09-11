class ContactImporter
	def initialize(path)
		file = File.read(path)
		file.each do |row|
			Contact.new(row)
		end
	end
end