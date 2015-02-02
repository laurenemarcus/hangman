class DeleteUsedLettersTableCreateGuessTable < ActiveRecord::Migration
  def change
    drop_table :used_letters



    create_table :guesses do |t|
      t.string :guess
      t.boolean :included
      t.integer :word_id
      t.timestamps null:false
    end
  end
end
