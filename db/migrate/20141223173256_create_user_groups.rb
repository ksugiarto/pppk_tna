class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.string :name

      t.timestamps
    end

    user_group_developer = UserGroup.create(:name => 'Developer')
    user_group_admin = UserGroup.create(:name => 'Administrator')
    UserGroup.create(:name => 'Sub Bagian Tata Usaha')
    UserGroup.create(:name => 'Seksi Pelayanan Pendidikan')
    UserGroup.create(:name => 'Kepala UPT')

    # update user if user don't have user group yet.
    # for DEVELOPER
    developers = User.where("username IN ('kristono') OR email IN ('kristono.sugiarto@gmail.com')")
    developers.each do |developer|
      developer.update_attributes(:user_group_id => user_group_developer.id)
    end

    # for other, give ADMINISTRATOR for now, just so all user that had been added have an user group.
    others = User.where("username NOT IN ('kristono') OR email NOT IN ('kristono.sugiarto@gmail.com')")
    others.each do |other|
      other.update_attributes(:user_group_id => user_group_admin.id)
    end
  end
end
