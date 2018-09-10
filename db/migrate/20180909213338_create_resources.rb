class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.integer :teacher_id
      t.string :title

      t.timestamps
    end
  end
end