class Project < ActiveRecord::Base
  has_and_belongs_to_many :users
  validates_presence_of :name, :framework
  after_create :notify_project_creation
  after_update :notify_project_update

  FRAMEWORKS = [:rails, :symfony]

  def hg_clone_url
    HgManager::project_clone_url(self.name)
  end

  def notify_project_creation
    NotifyMailer.deliver_project_save(project, "Project Created")
  end

  def notify_project_update
    NotifyMailer.deliver_project_save(project, "Project Updated")
  end

  def owners_emails
    self.users.collect {|user| user.email}
  end
end
