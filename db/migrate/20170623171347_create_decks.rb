class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :decks do |t|
      t.string :category, null: false
      t.boolean :private, null: false, default: false
      t.integer :creator_id, null: false

      t.timestamps
    end
  end
end
