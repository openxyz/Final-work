class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "to:#{message.to}:  #{message.subject}"
    #message.to = Rails.env.development? ? "xxx@qq.com" : "xxx2@qq.com"
    message.to =  "#{message.to}"
    #message.cc =  "xxx@qq.com"
  end
end