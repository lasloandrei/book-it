namespace :import do
  desc "IMPORT"
  task contacts: :environment do
    ContactImporter.new(path)
  end
end