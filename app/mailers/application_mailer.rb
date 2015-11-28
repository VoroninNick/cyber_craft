class ApplicationMailer < ActionMailer::Base
  layout 'mailer'

  def receivers(name)
    config_class = "FormConfigs::#{name.classify}".constantize
    to = config_class.first.try(&:emails) || config_class.default_emails
    to
  end

  def new_message(msg)
    @msg = msg

    mail(
        template_name: "message",
        to: receivers("message"),
        from: "CyberCraft",
        subject: "New message"
    )
  end
end
