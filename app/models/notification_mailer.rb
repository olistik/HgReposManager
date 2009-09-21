class NotificationMailer < ActionMailer::Base
  def project_save(project, mail_subject)
    recipients project.owners_emails
    from "Repository Manager Notifications <notifications@repomanager.com>"
    subject mail_subject
    sent_on Time.now
    body :project => project
  end 
end
