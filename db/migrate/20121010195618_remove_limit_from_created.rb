class RemoveLimitFromCreated < ActiveRecord::Migration
  def up
    change_column :users, :created, :integer, :limit => 20
  end

  def down
  end
end
