class AddSearchableTextToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :searchable_text, :string, array: true, default: [], null: false
  end
end
