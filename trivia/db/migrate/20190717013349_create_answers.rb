class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :answer
      t.references :question, null: false, foreign_key: true
      t.boolean :tipo
	
      t.timestamps
    end
  end
end
