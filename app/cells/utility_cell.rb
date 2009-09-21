class UtilityCell < Cell::Base
  def dashboard
    @user = @opts[:user]
    render
  end
end
