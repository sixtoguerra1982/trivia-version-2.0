class CreateAnswersusers < ActiveRecord::Migration[5.1]
  def change
    create_table :answersusers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true
      t.integer :question
      t.boolean :value
      
      t.timestamps
    end
  end
end
