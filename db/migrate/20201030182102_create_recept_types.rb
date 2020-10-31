class CreateReceptTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :recept_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
