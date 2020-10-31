class CreatePlanersRecepts < ActiveRecord::Migration[6.0]
  def change
    create_table :planers_recepts do |t|
      t.references :planer, null: false, foreign_key: true
      t.references :recept, null: false, foreign_key: true
      t.timestamps
    end
  end
end
