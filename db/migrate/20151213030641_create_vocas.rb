class CreateVocas < ActiveRecord::Migration
  def change
    create_table :vocas do |t|
      
      t.integer :user_id
      
      t.string :word
      t.string :meaning
      t.integer :step
      t.integer :day

      t.timestamps null: false
    end
  end
end
