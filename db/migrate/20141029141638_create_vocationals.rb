class CreateVocationals < ActiveRecord::Migration
  def change
    create_table :vocationals do |t|
      t.integer :curicculum_id
      t.string :name
      t.string :class_for

      t.timestamps
    end
  end
end
