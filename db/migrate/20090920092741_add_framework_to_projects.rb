class AddFrameworkToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :framework, :string
  end

  def self.down
    remove_column :projects, :framework
  end
end
