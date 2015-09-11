require 'rails_helper'

RSpec.describe ContactImporter do
	let(:path) { 'PATH_ON_DISK' }

	it 'imports from a file' do
		ContactImporter.new(path)
	end
end