class Course < ApplicationRecord
  WEEK_DAYS = 7
  MONTH_WEEKS = 4

  has_attached_file :image, preserve_files: true, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :resolution, preserve_files: true
  has_attached_file :evaluative_file, preserve_files: true, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment_file_name :image, :matches => [/jpg\Z/, /jpe?g\Z/, /jpeg\Z/, /png\Z/, /gif\Z/]
  validates_attachment_content_type :resolution, content_type: ['application/pdf']
  validates_attachment_file_name :resolution, :matches => [/pdf\Z/]
  validates_attachment :evaluative_file,  content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", 'application/pdf', 'application/odt', 'application/ods', 'application/doc', 'application/docx', 'application/xls'] }

  validates :name, :modality_id, :teachers, :description, :start_date, :finish_date, presence: true
  validates :image, presence: {message: I18n.t('errors.messages.upload_image') }
  validates :summary, length: {maximum: 100, message: I18n.t('errors.messages.summary_too_long')}, allow_blank: true
  validates :resolution_number, presence: {message: I18n.t('errors.messages.input_resolution_number') }, if: "resolution.present?"
  validates :resolution, presence: {message: I18n.t('errors.messages.upload_resolution') }, if: "resolution_number.present?"

  has_many :course_modules
  has_many :inscriptions
  has_many :people, through: :inscriptions
  has_many :students, through: :inscriptions
  has_and_belongs_to_many :teachers, class_name: "Person"
  belongs_to :modality
  delegate :name, to: :modality, prefix: true

  before_save :validate_start_before_finish_date, :validate_inscription_dates, if: :conditions_to_save?

  scope :active, ->() {
    where('start_date < ? AND finish_date > ?', Date.today, Date.today)
  }
  scope :unstarted, ->() { where('start_date > ?', Date.today) }

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

  def multiple_choice?
    modality.multiple_choice?
  end

  private

  def validate_start_before_finish_date
    return if start_date.blank? || finish_date.blank?
    errors.add(:start_date, I18n.t('errors.messages.must_be_after_today')) unless start_date >= Date.today
    errors.add(:start_date, I18n.t('errors.messages.must_be_before_finish_date')) unless start_date <= finish_date
  end

  def validate_inscription_dates
    return unless start_inscription_date and finish_inscription_date
    return errors.add(:start_inscription_date, I18n.t('errors.messages.must_be_after_today')) unless start_inscription_date >= Date.today
    return errors.add(:start_inscription_date, I18n.t('errors.messages.must_be_before_finish_inscription_date')) unless start_inscription_date <= finish_inscription_date
    return errors.add(:start_inscription_date, I18n.t('errors.messages.must_be_before_start_date')) unless start_inscription_date <= start_date && finish_inscription_date <= start_date
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

  def conditions_to_save?
    quiz_description_changed? || evaluative_file_file_name_changed?
  end
end
