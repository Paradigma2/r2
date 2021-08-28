class JobApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :job_applications do |t|
      t.references :job_ad, foreign_key: true, null: false
      t.string :email, null: false
      t.string :full_name, null: false
      t.date :date_of_birth
      t.string :address, null: false
      t.string :phone_number, null: false
      t.integer :qualification, null: false

      t.timestamps
    end
  end
end
