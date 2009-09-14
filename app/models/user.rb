class User < ActiveRecord::Base
  acts_as_authentic do |config|
    config.maintain_sessions = false
  end
end
