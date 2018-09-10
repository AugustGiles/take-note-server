class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.integer :user_id
      t.string :title
      t.text :description, default: ''

      t.timestamps
    end
  end
end
