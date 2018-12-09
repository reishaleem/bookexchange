class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.integer :edition
      t.string :author
      t.integer :condition
      t.decimal :price
      t.string :course
      t.string :professor
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :books, [:title]
    add_index :books, [:condition]
  end
end
