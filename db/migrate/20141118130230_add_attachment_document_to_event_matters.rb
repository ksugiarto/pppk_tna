class AddAttachmentDocumentToEventMatters < ActiveRecord::Migration
  def self.up
    change_table :event_matters do |t|
      t.attachment :document
    end
  end

  def self.down
    drop_attached_file :event_matters, :document
  end
end
