require 'rails_helper'

RSpec.describe LoanDocument, type: :model do
  describe 'when edit loan document' do
    
    context 'with initial attributes' do
      subject { build(:loan_document) }

      it 'has approved false' do
        expect(subject.approved.present?).to be false
      end

      it 'does not have an attached file' do
        expect(subject.file.attached?).to be false
      end
    end

    context 'when user uploaded document' do
      subject { build(:loan_document, :with_file) }

      it 'is valid' do
        expect(subject.valid?).to be true
      end

      it 'has a attached file' do
        expect(subject.file.attached?).to be true
      end
    end
  end
end
