class RemoveImageFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :image, :string
  end
end
