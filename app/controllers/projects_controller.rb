class ProjectsController < ResourceController::Base
  new_action.before do
    @users = User.all.collect {|user| [user.login, user.id]}
  end

  create.after do
    object.update_attribute :log, HgManager::execute_cmd("new", "#{object.name} #{object.framework}")
  end

  destroy.before do
    flash[:shell_output] = HgManager::execute_delete(object.name)
  end
end
