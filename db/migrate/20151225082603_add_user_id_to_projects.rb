class AddUserIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :user_id, :string
    add_index :projects, :user_id
  end
end
