class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_picture.subject
  #
  def sendmail_picture(picture)
    @pictures = picture

    mail to: @pictures.user.email,
      subject: 'アップロードありがとうございました！'
  end
end
