class CreateJoinTableForDoctorAndPatientt < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors_patients do |t|
      t.references :doctor, foreign_key: true
      t.references :patient, foreign_key: true
    end
  end
end
