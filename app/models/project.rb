class Project < ActiveRecord::Base
  def hg_clone_url
    HgManager::project_clone_url(self.name)
  end
end
