class CreateCompanyProfiles < ActiveRecord::Migration
  def change
    create_table :company_profiles do |t|
      t.string :name
      t.string :full_name
      t.string :address
      t.integer :city_id

      t.timestamps
    end
  end
end
