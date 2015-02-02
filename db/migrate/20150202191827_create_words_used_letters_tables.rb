class CreateWordsUsedLettersTables < ActiveRecord::Migration
  def change
    create_table(:words) do |t|
      t.string (:word)
      t.timestamps null:false
    end
    create_table :used_letters do |t|
      t.string :used_letter
      t.boolean :included
      t.timestamps null:false
    end
  end
end
