require 'rails_helper'

describe CourseModule do
  describe 'validations' do
    let (:course_module) {build :course_module}
    it 'fails if it does not have any quiz' do
      expect(course_module.valid?).to be false
    end 
  end
end