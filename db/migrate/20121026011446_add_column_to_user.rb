class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :identities, :text
  end
end
