class CreateRecepts < ActiveRecord::Migration[6.0]
  def change
    create_table :recepts do |t|
      t.string :name
      t.references :recept_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
