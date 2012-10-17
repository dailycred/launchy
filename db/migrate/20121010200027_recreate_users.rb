class RecreateUsers < ActiveRecord::Migration
  def self.up
    if !table_exists? :users
      create_table :users do |t|
        t.string :provider
        t.string :uid
        t.string :email
        t.integer :created
        t.string :username
        t.boolean :verified
        t.boolean :admin
        t.string :referred_by
        t.string :token
        t.text :facebook
        t.text :tags
        t.text :referred
        t.text :google
        t.text :twitter
        t.text :github
        t.text :access_tokens
        t.boolean :subscribed
        t.string :display

        t.timestamps
      end
    else
      safe_column :users, :provider, :string
      safe_column :users, :uid, :string
      safe_column :users, :email, :string
      safe_column :users, :created, :integer
      safe_column :users, :username, :string
      safe_column :users, :verified, :booleanied
      safe_column :users, :admin, :boolean
      safe_column :users, :referred, :string
      safe_column :users, :token, :string
      safe_column :users, :facebook, :text
      safe_column :users, :tags, :text
      safe_column :users, :referred, :text
      safe_column :users, :google, :text
      safe_column :users, :twitter, :text
      safe_column :users, :github, :text
      safe_column :users, :access_tokens, :text
      safe_column :users, :display, :string
      safe_column :users, :subscribed, :boolean
    end
  end

  def self.down
    drop_table :users
  end

  private

  def table_exists? table
    ActiveRecord::Base.connection.table_exists?(table.to_s)
  end

  def column_exists?(table, column)
    begin
      ActiveRecord::Base.connection.columns(table.to_s).map(&:name).include?(column.to_s)
    rescue NoMethodError #actual_columns is empty and it doesn't respond to the map method
      false
    end
  end

  def safe_column table, name, type
    add_column table.to_sym, name.to_sym, type.to_sym unless column_exists? table, name
  end

end
