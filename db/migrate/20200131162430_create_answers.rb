class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :text
      t.integer :question_id
      t.integer :linked_card
      t.boolean :is_finish

      t.timestamps
    end
  end
end
