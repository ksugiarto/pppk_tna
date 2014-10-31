class CreateCoreCompetencies < ActiveRecord::Migration
  def change
    create_table :core_competencies do |t|
      t.integer :vocational_id
      t.integer :seq_num
      t.text :description

      t.timestamps
    end
  end
end
