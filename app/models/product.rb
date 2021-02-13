class Product < ApplicationRecord
  include Commen
  has_many :stores, through: :ware_houses
end
