class AddKiegeszitokToReceptConnect < ActiveRecord::Migration[6.0]
  def change
    add_column :recept_connects, :unit, :string
    add_column :recept_connects, :amount, :float
  end
end
