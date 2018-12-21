class AddTextToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :text, :string, array: true, default: []
  end
end
