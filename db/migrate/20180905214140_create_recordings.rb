class CreateRecordings < ActiveRecord::Migration[5.2]
  def change
    create_table :recordings do |t|
      t.integer :assignment_id
      t.binary :recording

      t.timestamps
    end
  end
end
