module Notification
  class SlackService
    def initialize(message="")
      @message = message
    end

    def perform
      "some slack notice"
    end
    
    
  end
end