class CreateReceptConnects < ActiveRecord::Migration[6.0]
  def change
    create_table :recept_connects do |t|
      t.references :recept, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true
      t.references :size, null: false, foreign_key: true

      t.timestamps
    end
  end
end
