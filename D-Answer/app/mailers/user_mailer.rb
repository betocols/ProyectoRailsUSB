class UserMailer < ActionMailer::Base
  default from: "danswerusb@gmail.com"
  
  def answer_email(user)
    @user = user
    @url  = "http://localhost:3000"
    mail(:to => user.email, :subject => "Nueva respuesta en D-Answer")
  end

  def commentqs_email(user)
    @user = user
    @url  = "http://localhost:3000"
    mail(:to => user.email, :subject => "Nuevo comentario de pregunta en D-Answer")
  end  

  def commentas_email(user)
    @user = user
    @url  = "http://localhost:3000"
    mail(:to => user.email, :subject => "Nuevo comentario de respuesta en D-Answer")
  end  
end
