class CreateUsersEmailNulltrue < ActiveRecord::Migration[6.1]
  def change
    create_table :users_email_nulltrues do |t|
      change_column_null :users, :email, true 
      t.timestamps
    end
  end
end
