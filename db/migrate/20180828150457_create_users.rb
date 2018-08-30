class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.references :teacher, index: true
      t.string :username, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
