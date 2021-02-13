class Store < ApplicationRecord
  include Commen
  has_many :products, through: :ware_houses
end
