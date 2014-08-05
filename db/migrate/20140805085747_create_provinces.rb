class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.integer :country_id
      t.string :name

      t.timestamps
    end
  end
end
