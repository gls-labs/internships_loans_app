require 'rails_helper'

RSpec.describe LoanDocument, type: :model do
  describe 'associations' do
    it 'contains belongs_to associations' do
      is_expected.to belong_to(:loan)
      is_expected.to belong_to(:document)
    end
  end

  describe 'model' do
    let!(:loan) { create(:loan) }

    subject { build(:loan_document, loan: loan) }

    describe 'validations' do
      it 'validate boolean for approved' do
        is_expected.to allow_value(%(true false)).for(:approved)
        is_expected.to_not allow_value(nil).for(:approved)
      end
    end
  end
end
