class CreateTeacherVocationals < ActiveRecord::Migration
  def change
    create_table :teacher_vocationals do |t|
      t.integer :teacher_id
      t.integer :vocational_id
      t.text :notes

      t.timestamps
    end
  end
end
