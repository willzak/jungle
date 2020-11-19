class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def email_receipt
    @order = params[:order]

    mail(
      to: "williamzak0@gmail.com",
      subject: "Thank You For Your Order # #{@order.id}!",
      content_type: "text/html",
      body: "<html><strong>Thank you!</strong>Your order has been placed!</html>"
    )
  end
end
