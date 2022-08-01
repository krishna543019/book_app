namespace :test_app do
  task check_for_updates: :environment do
     puts "inside rake task" 
     Book.where(table_updated: true).find_each do |book|
        BookUpdateHandler.perform_async(book.id)
     end
  end 
end
