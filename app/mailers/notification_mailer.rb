class NotificationMailer < ActionMailer::Base
  default from: "no-reply@bakednoms.com"

  def comment_added
    mail(to: "smith.saintil@gmail.com",
      subject: "A comment has been added to your place")  
  end

end
