class Inscription < ApplicationRecord
  belongs_to :person
  delegate :full_name,
    :dni,
    :province_name,
    to: :person, prefix: true
  belongs_to :student, foreign_key: :person_id
  belongs_to :course

  validates :course_id, :person_id, :payment, presence: true
  validates :person_id, uniqueness: { scope: :course_id }

  before_save :validate_payment

  def self.enrolled?(course, person)
    self.where(course: course, person: person).exists?
  end

  private

  def validate_payment
    return if payment.blank?
    errors.add(:payment, I18n.t('errors.messages.payment_error')) unless payment >= course.price
  end

end
