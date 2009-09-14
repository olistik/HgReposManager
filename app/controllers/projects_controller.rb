class ProjectsController < ResourceController::Base
  create.after do
    object.update_attribute :log, HgManager::execute_cmd("new", object.name)
  end

  destroy.before do
    flash[:shell_output] = HgManager::execute_cmd("delete", object.name)
  end
end
