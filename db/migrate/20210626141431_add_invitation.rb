class AddInvitation < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :invitation, :integer, default: 0
  end
end
