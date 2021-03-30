class StatusItemCardboxFromUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :hp, :integer, default: 10
    add_column :users, :atc, :integer, default: 1
    add_column :users, :defence, :integer, default: 1
    #add_column :users, :items, :references
    #add_column :users, :cards, :references
  end
end
