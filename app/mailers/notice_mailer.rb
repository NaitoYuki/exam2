class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_picture.subject
  #
  def sendmail_picture(picture)
    @greeting = "Hi"

    mail to: "to@example.org",
      subject: '【Achieve】ブログが投稿されました'
  end
end