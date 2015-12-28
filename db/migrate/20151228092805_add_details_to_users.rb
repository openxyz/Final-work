class AddDetailsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :stuId, :string
    add_column :users, :stuName, :string
  end

  def self.down
    remove_column :users, :stuId, :string
    remove_column :users, :stuName, :string
  end
end
