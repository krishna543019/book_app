class BookUpdateHandler
  include Sidekiq::Worker
  sidekiq_options retry: false 

  def perform(book_id)
    book = Book.find book_id rescue nil
    if book
      #update the boolean flag back to false
      book.update(table_updated: false)
      puts "updated table_updated back to false" 
      #put the logic here
    end
  end 

end
