class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :nss
      t.string :npsn
      t.string :name
      t.integer :status
      t.string :address
      t.integer :city_id
      t.integer :province_id
      t.integer :country_id
      t.string :phone
      t.string :fax
      t.string :email
      t.integer :curicculum_id
      t.string :built_year
      t.string :start_year

      t.timestamps
    end
  end
end
