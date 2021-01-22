class CreateRoutineTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :routine_tasks do |t|
      t.integer :user_id, null: false
      t.string :routine_task_name, null: false

      t.timestamps
    end
  end
end
