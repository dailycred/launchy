class ChangeColumnAgain < ActiveRecord::Migration
  def up
    change_column :users, :created, :bigint
  end

  def down
  end
end
