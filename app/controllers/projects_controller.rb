class ProjectsController < ResourceController::Base
  create.after do
    object.update_attribute :log, HgManager::execute_new(object.name)
  end

  destroy.before do
    flash[:shell_output] = HgManager::execute_delete(object.name)
  end
end
