class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title, :author, :language, null: false
      t.datetime :release_date, null: false

      t.timestamps
    end
  end
end
