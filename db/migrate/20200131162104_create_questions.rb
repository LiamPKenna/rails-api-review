class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :text
      t.integer :quiz_id
      t.boolean :is_binary
      t.integer :y_link
      t.integer :n_link
      t.boolean :y_is_final
      t.boolean :n_is_final

      t.timestamps
    end
  end
end
