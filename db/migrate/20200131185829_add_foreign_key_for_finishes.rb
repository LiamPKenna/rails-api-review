class AddForeignKeyForFinishes < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :finishes, :quizzes
  end
end
