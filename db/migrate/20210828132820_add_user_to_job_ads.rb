class AddUserToJobAds < ActiveRecord::Migration[5.2]
  def change
    change_table :job_ads do |t|
      t.references :user, foreign_key: true
    end
  end
end
