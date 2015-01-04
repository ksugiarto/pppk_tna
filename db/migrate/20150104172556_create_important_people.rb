class CreateImportantPeople < ActiveRecord::Migration
  def change
    create_table :important_people do |t|
      t.string :position
      t.string :nip
      t.string :name

      t.timestamps
    end

    ImportantPerson.create(:position => 'Kepala UPT', :nip => '195807271980031016', :name => 'Drs. Sumardijono, M.Si.')
  end
end
