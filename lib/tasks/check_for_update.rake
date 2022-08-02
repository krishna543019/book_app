namespace :test_app do
  desc "Rake to check for table update"
  task check_for_updates: :environment do
     Book.where(table_updated: true).find_each do |book|
        #Below method calls async sidekiq function
        BookUpdateHandler.perform_async(book.id)
     end
  end 
end
