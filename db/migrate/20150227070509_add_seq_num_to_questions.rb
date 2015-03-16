class AddSeqNumToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :seq_num, :integer
  end
end
