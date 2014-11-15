class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.integer :school_id
      t.string :nip
      t.string :front_title
      t.string :first_name
      t.string :last_name
      t.string :end_title
      t.string :born_place
      t.date :born_date
      t.integer :gender
      t.string :email
      t.integer :religion
      t.string :address
      t.integer :city_id
      t.integer :province_id
      t.integer :country_id
      t.string :start_teach

      t.timestamps
    end
  end
end
