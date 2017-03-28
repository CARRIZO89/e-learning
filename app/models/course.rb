class Course < ApplicationRecord
  WEEK_DAYS = 7
  MONTH_WEEKS = 4

  has_attached_file :image, preserve_files: true, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :resolution, preserve_files: true
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment_file_name :image, :matches => [/jpg\Z/, /jpe?g\Z/, /jpeg\Z/, /png\Z/, /gif\Z/]
  validates_attachment_content_type :resolution, content_type: ['application/pdf']
  validates_attachment_file_name :resolution, :matches => [/pdf\Z/]
  validates :name, presence: {message: 'No puede estar en blanco.' }

  has_many :course_modules
  has_many :inscriptions
  has_many :people, through: :inscriptions
  has_and_belongs_to_many :teachers, class_name: "Person"
  belongs_to :modality
  delegate :name, to: :modality, prefix: true

  acts_as_ordered_taggable # Alias for acts_as_taggable_on :tags
  acts_as_ordered_taggable_on :topics

  def teacher_names
    teachers.map(&:full_name)
  end

  def count_inscriptions
    inscriptions.count
  end

  def count_modules
    course_modules.count
  end

  def display_duration
    return I18n.t('activerecord.attributes.course.duration.days', days: duration_in_days) if duration_in_days < 14
    return I18n.t('activerecord.attributes.course.duration.weeks', weeks: duration_in_weeks) if duration_in_weeks < 12
    I18n.t('activerecord.attributes.course.duration.months', months: duration_in_months)
  end

  def duration_in_days
    (finish_date - start_date).to_i
  end

  def duration_in_weeks
    (duration_in_days.to_f / WEEK_DAYS).ceil
  end

  def duration_in_months
    (duration_in_weeks.to_f / MONTH_WEEKS).ceil
  end

end
