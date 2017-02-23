class AddAttachmentResolutionToCourses < ActiveRecord::Migration
  def self.up
    change_table :courses do |t|
      t.attachment :resolution
    end
  end

  def self.down
    remove_attachment :courses, :resolution
  end
end
