class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :email
      t.integer :created, :limit => 8
      t.string :username
      t.boolean :verified
      t.boolean :admin
      t.string :referred_by
      t.string :token
      t.text :facebook
      t.text :tags
      t.text :referred

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
