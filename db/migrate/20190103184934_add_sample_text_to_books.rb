class AddSampleTextToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :sample_text, :string
  end
end
