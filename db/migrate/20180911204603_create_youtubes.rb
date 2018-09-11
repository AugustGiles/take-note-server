class CreateYoutubes < ActiveRecord::Migration[5.2]
  def change
    create_table :youtubes do |t|
      t.integer :user_id
      t.string :title
      t.text :description, default: ''
      t.string :link

      t.timestamps
    end
  end
end
