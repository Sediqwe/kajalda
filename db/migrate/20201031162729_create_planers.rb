class CreatePlaners < ActiveRecord::Migration[6.0]
  def change
    create_table :planers do |t|
      t.string :day
      t.references :recept, null: false, foreign_key: true

      t.timestamps
    end
  end
end
