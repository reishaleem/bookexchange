class ChangeBookConditionToString < ActiveRecord::Migration[5.2]
  def change
    change_column :books, :condition, :string
  end
end
