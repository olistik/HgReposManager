class User < ActiveRecord::Base
  ADMIN_LOGIN = "admin"

  has_and_belongs_to_many :projects

  acts_as_authentic do |config|
    config.maintain_sessions = false
  end

  def is_admin?
    return login == ADMIN_LOGIN
  end
end
