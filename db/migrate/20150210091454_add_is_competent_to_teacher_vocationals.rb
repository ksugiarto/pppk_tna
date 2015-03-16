class AddIsCompetentToTeacherVocationals < ActiveRecord::Migration
  def change
    add_column :teacher_vocationals, :is_competent, :integer
  end
end
