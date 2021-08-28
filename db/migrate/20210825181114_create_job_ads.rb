class CreateJobAds < ActiveRecord::Migration[5.2]
  def change
    create_table :job_ads do |t|
      t.string :name, null: false
      t.text :description
      t.string :employer, null: false
      t.string :email, null: false
      t.integer :category, null: false
      t.date :valid_until
      t.string :document

      t.timestamps
    end
  end
end
