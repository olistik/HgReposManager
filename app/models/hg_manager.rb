class HgManager
  HG_CONFIG = YAML.load_file(RAILS_ROOT + "/config/hg.yml")

  def self.project_cmd_path(cmd)
    HG_CONFIG["scripts"]["path"] + "/" + HG_CONFIG["scripts"]["commands"][cmd.to_s]
  end

  def self.execute_cmd(cmd, param)
    %x{"#{project_cmd_path(cmd)}" "#{param}"}
  end

  def self.project_clone_url(project_name)
      "ssh://localhost/" + HG_CONFIG["repos"]["path"] + "/" + project_name
  end
end
