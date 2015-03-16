class CreateTeacherSubjectDetails < ActiveRecord::Migration
  def change
    create_table :teacher_subject_details do |t|
      t.integer :teacher_subject_id
      t.integer :subject_id
      t.integer :is_competent

      t.timestamps
    end
  end
end
