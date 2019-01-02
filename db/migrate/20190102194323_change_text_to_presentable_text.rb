class ChangeTextToPresentableText < ActiveRecord::Migration[5.1]
  def change
  	rename_column :books, :text, :presentable_text
  end
end
