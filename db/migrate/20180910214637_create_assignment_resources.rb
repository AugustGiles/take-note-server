class CreateAssignmentResources < ActiveRecord::Migration[5.2]
  def change
    create_table :assignment_resources do |t|
      t.integer :assignment_id
      t.integer :resource_id

      t.timestamps
    end
  end
end
