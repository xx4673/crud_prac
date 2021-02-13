class NameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.starts_with? 'Roxy'
      record.errors[attribute] << "must begin with Roxy"
    end
  end 
end