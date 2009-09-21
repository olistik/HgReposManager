class Project < ActiveRecord::Base
  has_and_belongs_to_many :users
  validates_presence_of :name, :framework

  FRAMEWORKS = [:rails, :symfony]

  def hg_clone_url
    HgManager::project_clone_url(self.name)
  end
end
