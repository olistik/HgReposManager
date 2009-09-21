# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def project_owners_list(project, users_separator)
    users_collection = project.users.collect do |user|
      "#{user.login} #{user.email}"
    end
    users_collection.join(users_separator)
  end
end
