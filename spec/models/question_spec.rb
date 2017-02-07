require 'rails_helper'

describe Question do
  describe 'validations' do
    describe '.only_one_right_answer' do
      let(:question) { build :question }

      it 'fails if it does not have any answer' do
        expect(question.valid?).to be false
      end
      
      it 'fails if it has more than one right answer' do
        answers = build_list :right_answer, 2
        question.answers = answers
        is_valid = question.valid?
        expect(is_valid).to be false
        expect(question.errors).to include(:answers)
        expect(question.errors[:answers].length).to eql 1
        expect(question.errors[:answers][0]).to eql 'One answer must be right'
      end

      it 'fails if it does not have any right answer' do
        question.answers << build(:wrong_answer)
        expect(question.valid?).to be false
      end

      it 'fails if it has more than three answer' do
        answers = build_list :right_answer, 4
        question.answers = answers
        expect(question.valid?).to be false
      end
    end
  end
end