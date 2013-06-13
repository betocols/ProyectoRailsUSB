class UserMailer < ActionMailer::Base
  default from: "notification@d-answer.com"
  
  def answer_email(user, question)
    @user = user
    @url  = "http://localhost:3000/questions/question.id"
    mail(:to => user.email, :subject => "Nueva respuesta en D-Answer")
  end

  def commentqs_email(user, question)
    @user = user
    @url  = "http://localhost:3000/questions/question.id"
    mail(:to => user.email, :subject => "Nuevo comentario de pregunta en D-Answer")
  end  

  def commentas_email(user, question)
    @user = user
    @url  = "http://localhost:3000/questions/question.id"
    mail(:to => user.email, :subject => "Nuevo comentario de respuesta en D-Answer")
  end  
end
