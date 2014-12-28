class AddAttachmentLogoToCompanyProfiles < ActiveRecord::Migration
  def self.up
    change_table :company_profiles do |t|
      t.attachment :logo
    end
  end

  def self.down
    drop_attached_file :company_profiles, :logo
  end
end
