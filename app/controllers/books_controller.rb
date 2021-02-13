class BooksController < ApplicationController
  def borrow
    if @book && @book.is_available?
      @book.borrow!
      
      #sms
      service = Notification::SmsService.new("#{@book.title} has successfully booked!")
      service.perform

      #slack notice
      service = Notification::SlackService.new("#{@book.title} has already been booked!")
      service.perform

      #or
      service = case service.settings.notify_service
                when "slack"
                  Notification::SlackService.new("hihi")
                when "sms"
                  Notification::SmsService.new("wowWow")
                else
                  "blablabla"
                end
      service.perform                

      notifier.ping "#{@book.title} already been borrowed"
    else
      redirect_to book_path, notice"unable to be borrowed"
    end
  end
  
end
