class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :user_id, null: false
      t.string :task_title, null: false
      t.text :task_details
      t.date :start_date
      t.date :end_date
      t.integer :task_status, default: 0
      t.integer :task_matrix, null: false

      t.timestamps
    end
  end
end
