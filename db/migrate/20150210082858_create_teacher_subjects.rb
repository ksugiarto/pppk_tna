class CreateTeacherSubjects < ActiveRecord::Migration
  def change
    create_table :teacher_subjects do |t|
      t.integer :teacher_id
      t.integer :teacher_vocational_id
      t.integer :basic_competency_id
      t.integer :is_competent

      t.timestamps
    end
  end
end
