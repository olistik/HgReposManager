class HgManager
  HG_CONFIG = YAML.load_file(RAILS_ROOT + "/config/hg.yml")

  def self.project_cmd_path(cmd)
    HG_CONFIG["scripts"]["path"] + "/" + HG_CONFIG["scripts"]["commands"][cmd.to_s]
  end

  def self.execute_cmd(cmd, param)
    %x{"#{project_cmd_path(cmd)}" "#{param}"}
  end

  def self.execute_new(project_name)
    params = project_name
    params += " " + HG_CONFIG["repos"]["path"]
    params += " " + HG_CONFIG["scripts"]["path"]
    params += " " + HG_CONFIG["scripts"]["commands"]["sync"]
    params += " " + HG_CONFIG["webtests"]["host"]
    params += " " + HG_CONFIG["webtests"]["path"]
    params += " " + HG_CONFIG["temp_repos"]["path"]
    execute_cmd("new", params)
  end

  def self.execute_delete(project_name)
    params = project_name
    params += " " + HG_CONFIG["repos"]["path"]
    params += " " + HG_CONFIG["temp_repos"]["path"]
    params += " " + HG_CONFIG["webtests"]["host"]
    params += " " + HG_CONFIG["webtests"]["path"]
    execute_cmd("delete", params)
  end

  def self.project_clone_url(project_name)
    hostname = (%x{hostname}).strip
    "ssh://#{hostname}/#{HG_CONFIG["repos"]["path"]}/#{project_name}"
  end
end
