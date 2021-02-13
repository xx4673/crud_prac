class Doctor < ApplicationRecord
  validates :name, presence: true, name_validator: true
  has_and_belongs_to_many :patients
end
