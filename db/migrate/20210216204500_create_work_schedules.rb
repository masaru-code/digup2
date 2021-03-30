class CreateWorkSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :work_schedules do |t|
      t.references :task
      t.string :name, null: false
      t.integer :position, default: 1
      t.boolean :checkbox, default: 0
      t.text :advise
      t.timestamps
    end
  end
end
