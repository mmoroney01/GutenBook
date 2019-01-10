class AddSampleTextToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :sample_text, :string, null: false
  end
end
