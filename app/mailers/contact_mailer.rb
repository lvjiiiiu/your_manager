class ContactMailer < ApplicationMailer

  
  def send_mail()
    @contact = contact
    mail(
      from: 'system@example.com',
      to:   "#{ENV["EMAIL"]}",
      subject: 'お問い合わせ通知'
    )
  end
end
