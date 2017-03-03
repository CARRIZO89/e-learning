class AddYoutubelinkAndDescriptionToCourseModule < ActiveRecord::Migration[5.0]
  def change
    add_column :course_modules, :youtube_link, :string
    add_column :course_modules, :description, :text
  end
end
