class Notifier < ActionMailer::Base
  default :from => "support@projectlodge.org"

  def activation_instructions(user)
    subject   "Activation Instructions"
    from      "noreply@projectlodge.org"
    recipients user.email
    sent_on    Time.now
    body       :account_activation_url => user_activation_url(user.perishable_token)
  end

  def welcome(user)
    subject     "Welcome to the site!"
    from        "noreply@projectlodge.org"
    recipients  user.email
    body        :root_url => root_url
  end

end
