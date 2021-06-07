# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Loan, type: :model do
  describe 'when is new record' do
    before(:each) { subject.validate }

    context 'with invalid attributes' do
      it 'is invalid' do
        expect(subject.invalid?).to be true
      end

      it 'has errors' do
        expect(subject.errors).to_not be_empty
      end
    end

    context 'without an amount' do
      it 'has an amount related error' do
        expect(subject.errors).to have_key(:amount)
      end
    end

    context 'without an associated loan_type' do
      it 'has a loan_type related error' do
        expect(subject.errors).to have_key(:loan_type)
      end
    end

    context 'with all valid attributes' do
      subject { build(:loan) }

      it 'is valid' do
        expect(subject.valid?).to be true
      end

      it 'has an amount' do
        expect(subject.amount.present?).to be true
      end

      it 'has an numeric amount' do
        expect(subject.amount).to be_a(Numeric)
      end

      it 'has an associated loan_type' do
        expect(subject.loan_type).to be_instance_of(LoanType)
      end

      context 'is saved' do
        before(:each) { subject.save }
        let(:ltype) { subject.loan_type }
        let(:ldocs) { subject.loan_documents }

        it 'is persisted' do
          expect(subject.persisted?).to be true
        end

        it 'has the same documents that it loan type' do
          expect(ldocs.map(&:document_ids)).to match_array(ltype.document_ids)
        end
      end
    end
  end
end
