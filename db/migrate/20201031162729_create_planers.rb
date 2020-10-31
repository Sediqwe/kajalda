class CreatePlaners < ActiveRecord::Migration[6.0]
  def change
    create_table :planers do |t|
      t.string :day
      t.timestamps
    end
  end
end
