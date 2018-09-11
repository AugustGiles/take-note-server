class CreateAssignmentYoutubes < ActiveRecord::Migration[5.2]
  def change
    create_table :assignment_youtubes do |t|
      t.integer :assignment_id
      t.integer :youtube_id

      t.timestamps
    end
  end
end
