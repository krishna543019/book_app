class CreateTriggerBooksUpdate < ActiveRecord::Migration[6.0]
  def up
    drop_trigger("books_after_update_of_name_row_tr", "books", :generated => true)

    create_trigger("books_after_update_of_name_row_tr", :generated => true, :compatibility => 1).
        on("books").
        after(:update).
        of(:name) do
      "UPDATE books SET table_updated = true WHERE id = NEW.id;"
    end
  end

  def down
    drop_trigger("books_after_update_of_name_row_tr", "books", :generated => true)

    create_trigger("books_after_update_of_name_row_tr", :generated => true, :compatibility => 1).
        on("books").
        after(:update).
        of(:name) do
      "UPDATE books SET table_updated = true WHERE id = NEW.id;"
    end
  end
end
