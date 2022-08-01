
class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name
      t.float :price
      t.boolean :table_updated, default: false
      t.timestamps
    end
  end
end
