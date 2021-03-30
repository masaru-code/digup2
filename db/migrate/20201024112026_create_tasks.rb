class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
        t.references :user
        t.string :name, null: false
        t.integer :status, default: 0
      t.timestamps
    end
  end
end
