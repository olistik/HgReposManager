class AddLogToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :log, :text
  end

  def self.down
    remove_column :projects, :log
  end
end
