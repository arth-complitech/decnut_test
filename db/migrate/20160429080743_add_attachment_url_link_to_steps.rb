class AddAttachmentUrlLinkToSteps < ActiveRecord::Migration
  def self.up
    change_table :steps do |t|
      t.attachment :url_link
    end
  end

  def self.down
    remove_attachment :steps, :url_link
  end
end
