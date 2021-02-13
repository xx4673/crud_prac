module Notification
  class SmsService
    def initialize(message="")
      @message = message
    end

    def perform
      "some sms notice code"
    end    
  end
end