class CreateFinishes < ActiveRecord::Migration[5.2]
  def change
    create_table :finishes do |t|
      t.string :text
      t.string :sub_text
      t.string :img_src

      t.timestamps
    end
  end
end
