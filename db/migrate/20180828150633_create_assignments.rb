class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.integer :teacher_id
      t.integer :student_id
      t.jsonb :assignment_text, default: {}
      t.integer :practice_goal
      t.integer :current_practice_time, default: 0

      t.timestamps
    end
  end
end
