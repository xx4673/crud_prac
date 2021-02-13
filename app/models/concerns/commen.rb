module Commen
  extend ActiveSupport::Concern
  included do
    has_many :ware_houses
  end

  module ClassMethods      
  end
  
  def show_title
    title
  end
    
end