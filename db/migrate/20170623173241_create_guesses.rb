class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.integer :card_id, null: false
      t.integer :round_id, null: false
      t.string :result, null: false

      t.timestamps
  end
end
